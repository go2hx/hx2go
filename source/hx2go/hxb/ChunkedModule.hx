package hx2go.hxb;

import haxe.io.Bytes;
import hx2go.hxb.io.ByteReader;
import hx2go.hxb.io.ByteWriter;

/**
	The container layer: a single serialized HXB module as a `version` plus an
	ordered list of raw `chunks`.

	This is the most fundamental representation and the one that guarantees
	interoperability: `ChunkedModule.read(bytes).write()` reproduces the input
	**byte-for-byte** for any file the Haxe compiler emits, because chunks are
	already stored in declaration-ordinal order and the chunk framing is
	lossless.

	Work at this level when you want to inspect, reorder, add or drop whole
	chunks without decoding their contents. For a decoded view use
	`hxb.read.ModuleDecoder` / `hxb.HxbModule`.
**/
class ChunkedModule {
	/** The 3-byte magic that opens every HXB module. **/
	public static inline final MAGIC = "hxb";

	/** The HXB format version this library reads and writes. **/
	public static inline final VERSION = 1;

	/** The format version found in (or to be written to) the file. **/
	public var version:Int;

	/** The chunks, in the order they appear on disk. **/
	public var chunks:Array<Chunk>;

	public function new(?chunks:Array<Chunk>, version:Int = VERSION) {
		this.chunks = chunks == null ? [] : chunks;
		this.version = version;
	}

	/**
		Parse a serialized module: validates the `hxb` magic and version, then
		reads every chunk until (and including) `EOM`.
	**/
	public static function read(bytes:Bytes):ChunkedModule {
		final r = new ByteReader(bytes);
		final magic = r.readBytes(3).toString();
		if (magic != MAGIC)
			throw new HxbError('Not an HXB module: bad magic "$magic"');
		final version = r.readByte();
		if (version != VERSION)
			throw new HxbError('Unsupported HXB version $version (this library supports $VERSION)');
		final chunks = [];
		while (!r.eof()) {
			final name = r.readBytes(3).toString();
			final kind = ChunkKind.ofName(name);
			final length = r.readInt32();
			final data = r.readBytes(length);
			chunks.push(new Chunk(kind, data));
			if (kind == EOM)
				break;
		}
		return new ChunkedModule(chunks, version);
	}

	/**
		Serialize back to bytes. Chunks are emitted sorted by their declaration
		ordinal (the canonical on-disk order Haxe uses), so a freshly read
		module round-trips byte-for-byte.
	**/
	public function write():Bytes {
		final w = new ByteWriter();
		w.writeByte("h".code);
		w.writeByte("x".code);
		w.writeByte("b".code);
		w.writeByte(version);
		final sorted = chunks.copy();
		// Stable sort by declaration ordinal == canonical disk order.
		haxe.ds.ArraySort.sort(sorted, (a, b) -> a.kind.ordinal() - b.kind.ordinal());
		for (chunk in sorted) {
			final name = chunk.kind.toName();
			w.writeByte(name.charCodeAt(0));
			w.writeByte(name.charCodeAt(1));
			w.writeByte(name.charCodeAt(2));
			w.writeInt32(chunk.data.length);
			w.writeBytes(chunk.data);
		}
		return w.getBytes();
	}

	/** The first chunk of the given kind, or `null`. **/
	public function getChunk(kind:ChunkKind):Null<Chunk> {
		for (c in chunks)
			if (c.kind == kind)
				return c;
		return null;
	}

	/** Whether a chunk of the given kind is present. **/
	public inline function hasChunk(kind:ChunkKind):Bool {
		return getChunk(kind) != null;
	}

	/** Remove every chunk of the given kind; returns how many were removed. **/
	public function removeChunks(kind:ChunkKind):Int {
		var n = 0;
		var i = chunks.length;
		while (--i >= 0)
			if (chunks[i].kind == kind) {
				chunks.splice(i, 1);
				n++;
			}
		return n;
	}

	public function toString():String {
		return 'ChunkedModule(v$version, ${chunks.length} chunks: ${chunks.map(c -> c.kind.toName()).join(",")})';
	}
}
