package hx2go.hxb;

import haxe.io.Bytes;
import haxe.io.BytesInput;
import haxe.io.BytesOutput;
import haxe.zip.Entry;
import haxe.zip.Reader;
import haxe.zip.Writer;

#if go
import go.Map;
#end

@:structInit
class Slot {
	public var path:String;
	public var data:Bytes;
	public var time:Date;
}

/**
	An HXB archive: the zip file Haxe produces with `--hxb file.hxb`, holding one
	serialized module per entry under `<target>/<pack…>/<Name>.hxb`.

	`HxbArchive` lets you open such a file, navigate the modules it contains
	(by target, package, name or arbitrary predicate), pull out a single
	module's bytes (or a decoded `ChunkedModule`/`HxbModule`), and add, replace
	or drop modules before writing a fresh, Haxe-readable archive back out.

	Entries are kept in their original order; module payloads are preserved
	byte-for-byte, so reading and re-writing leaves every module identical.
**/
class HxbArchive {
	final slots:Array<Slot>;
	final index:Map<String, Int>;

	public function new() {
		slots = [];
		index = new Map();
	}

	/** An empty archive ready to receive modules. **/
	public static inline function empty():HxbArchive {
		return new HxbArchive();
	}

	/**
		Parse an archive from in-memory zip bytes.

		Reads via the zip's *central directory* (authoritative sizes + local
		header offsets) rather than streaming the local headers. This is what
		lets it read the archives the Haxe compiler emits with `--hxb`: those
		store every entry uncompressed but set the data-descriptor flag (general
		purpose bit 3), which leaves the sizes zero in the local headers — a
		shape `haxe.zip.Reader` mis-parses. Both stored and deflated entries are
		supported.
	**/
	public static function read(bytes:Bytes):HxbArchive {
		final archive = new HxbArchive();

		// Locate the End Of Central Directory record (scan back for its
		// signature, allowing for a trailing comment).
		final eocdSig = 0x06054b50;
		var eocd = -1;
		var p = bytes.length - 22;
		while (p >= 0) {
			if (bytes.getInt32(p) == eocdSig) {
				eocd = p;
				break;
			}
			p--;
		}
		if (eocd < 0)
			throw new HxbError("Not a zip archive: missing end-of-central-directory record");

		final total = bytes.getUInt16(eocd + 10);
		var cd = bytes.getInt32(eocd + 16); // central directory offset

		for (_ in 0...total) {
			if (bytes.getInt32(cd) != 0x02014b50)
				throw new HxbError("Corrupt zip: bad central directory entry");
			final flags = bytes.getUInt16(cd + 8);
			final compression = bytes.getUInt16(cd + 10);
			final dosTime = bytes.getUInt16(cd + 12);
			final dosDate = bytes.getUInt16(cd + 14);
			final csize = bytes.getInt32(cd + 20);
			final usize = bytes.getInt32(cd + 24);
			final fnameLen = bytes.getUInt16(cd + 28);
			final extraLen = bytes.getUInt16(cd + 30);
			final commentLen = bytes.getUInt16(cd + 32);
			final localOffset = bytes.getInt32(cd + 42);
			final utf8 = (flags & 0x800) != 0;
			final fileName = bytes.getString(cd + 46, fnameLen, utf8 ? UTF8 : null);

			// Find the entry's data: skip the local file header (fixed 30 bytes
			// + its own file-name and extra-field lengths, which can differ from
			// the central directory's).
			if (bytes.getInt32(localOffset) != 0x04034b50)
				throw new HxbError("Corrupt zip: bad local header for " + fileName);
			final lfNameLen = bytes.getUInt16(localOffset + 26);
			final lfExtraLen = bytes.getUInt16(localOffset + 28);
			final dataStart = localOffset + 30 + lfNameLen + lfExtraLen;

			if (!StringTools.endsWith(fileName, "/")) {
				final raw = bytes.sub(dataStart, csize);
				final data = switch (compression) {
					case 0: raw; // stored
					case 8: haxe.zip.InflateImpl.run(new BytesInput(raw)); // deflate
					case c: throw new HxbError("Unsupported zip compression method: " + c);
				}
				archive.rawPut(fileName, data, dosDateTime(dosDate, dosTime));
			}

			cd += 46 + fnameLen + extraLen + commentLen;
		}
		return archive;
	}

	static function dosDateTime(date:Int, time:Int):Date {
		final sec = (time & 31) << 1;
		final min = (time >> 5) & 63;
		final hour = (time >> 11) & 31;
		final day = date & 31;
		final month = (date >> 5) & 15;
		final year = (date >> 9) + 1980;
		return new Date(year, month - 1, day, hour, min, sec);
	}

	#if sys
	/** Load an archive from a file path. **/
	public static function load(path:String):HxbArchive {
		return read(sys.io.File.getBytes(path));
	}

	/** Write this archive to a file path. **/
	public function save(path:String):Void {
		sys.io.File.saveBytes(path, write());
	}
	#end

	// --- Raw entry access ---------------------------------------------------

	/** All entry paths, in archive order. **/
	public function entries():Array<String> {
		return [for (s in slots) s.path];
	}

	/** Number of entries. **/
	public inline function count():Int {
		return slots.length;
	}

	/** Whether an entry exists at `path`. **/
	public inline function exists(path:String):Bool {
		return index.exists(path);
	}

	/** Raw module bytes at `path`, or `null`. **/
	public function getBytes(path:String):Null<Bytes> {
		final i = index.get(path);
		return !index.exists(path) ? null : slots[i].data;
	}

	function rawPut(path:String, data:Bytes, ?time:Date):Void {
		final t = time == null ? Date.now() : time;
		if (index.exists(path)) {
			final existing = index.get(path);
			slots[existing].data = data;
			slots[existing].time = t;
		} else {
			index.set(path, slots.length);
			slots.push({path: path, data: data, time: t});
		}
	}

	/** Add or replace the raw bytes of an entry. **/
	public inline function put(path:String, data:Bytes, ?time:Date):Void {
		rawPut(path, data, time);
	}

	/** Remove an entry; returns `true` if it existed. **/
	public function remove(path:String):Bool {
		if (!index.exists(path))
			return false;

		final i = index.get(path);

		slots.splice(i, 1);
		index.remove(path);
		// reindex everything after i
		for (j in i...slots.length)
			index.set(slots[j].path, j);
		return true;
	}

	// --- Module navigation --------------------------------------------------

	/** Every module in the archive as a `ModuleRef`. **/
	public function modules():Array<ModuleRef> {
		return [for (s in slots) ModuleRef.ofEntryPath(s.path)];
	}

	/** The distinct targets present (first path segment of each entry). **/
	public function targets():Array<String> {
		final seen = new Map<String, Bool>();
		final out = [];
		for (s in slots) {
			final t = ModuleRef.ofEntryPath(s.path).target;
			if (!seen.exists(t)) {
				seen.set(t, true);
				out.push(t);
			}
		}
		return out;
	}

	/** All modules serialized for a particular target. **/
	public function modulesOf(target:String):Array<ModuleRef> {
		return modules().filter(m -> m.target == target);
	}

	/** Find modules matching a predicate. **/
	public function find(predicate:ModuleRef->Bool):Array<ModuleRef> {
		return modules().filter(predicate);
	}

	/**
		Find a single module by its dotted path (e.g. `haxe.ds.Vector`),
		optionally restricted to a target. Returns the first match or `null`.
	**/
	public function findModule(dotPath:String, ?target:String):Null<ModuleRef> {
		for (m in modules()) {
			if (m.dotPath() == dotPath && (target == null || m.target == target))
				return m;
		}
		return null;
	}

	/** Find every module whose name (ignoring package) equals `name`. **/
	public function findByName(name:String):Array<ModuleRef> {
		return modules().filter(m -> m.name == name);
	}

	/** Raw bytes for a `ModuleRef`. **/
	public inline function moduleBytes(ref:ModuleRef):Null<Bytes> {
		return getBytes(ref.entryPath);
	}

	/** Read a module as a raw `ChunkedModule` (no payload decoding). **/
	public function chunked(ref:ModuleRef):ChunkedModule {
		final b = moduleBytes(ref);
		if (b == null)
			throw new HxbError('No such module: ${ref.entryPath}');
		return ChunkedModule.read(b);
	}

	/** Decode a module into the structured `HxbModule` model. **/
	public function decode(ref:ModuleRef):HxbModule {
		final b = moduleBytes(ref);
		if (b == null)
			throw new HxbError('No such module: ${ref.entryPath}');
		return hx2go.hxb.read.ModuleDecoder.decode(b);
	}

	/** Add or replace a module by `(target, pack, name)`. **/
	public function putModule(target:String, pack:Array<String>, name:String, data:Bytes):ModuleRef {
		final path = ModuleRef.toEntryPath(target, pack, name);
		rawPut(path, data);
		return ModuleRef.ofEntryPath(path);
	}

	// --- Output -------------------------------------------------------------

	/** Serialize to zip bytes (stored/uncompressed, matching Haxe). **/
	public function write():Bytes {
		final out = new BytesOutput();
		final writer = new Writer(out);
		final list = new haxe.ds.List<Entry>();
		for (s in slots) {
			final entry:Entry = {
				fileName: s.path,
				fileSize: s.data.length,
				fileTime: s.time,
				compressed: false,
				dataSize: s.data.length,
				data: s.data,
				crc32: null
			};
			list.add(entry);
		}
		writer.write(list);
		return out.getBytes();
	}

	public function toString():String {
		return 'HxbArchive(${slots.length} modules, targets: ${targets().join(",")})';
	}
}
