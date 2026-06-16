package hx2go.hxb.io;

import haxe.Int64;
import haxe.io.Bytes;
import haxe.io.Encoding;
import haxe.io.FPHelper;

/**
	A forward, position-tracking reader over a `haxe.io.Bytes` buffer.

	Every primitive here is a faithful, byte-for-byte port of the encodings used
	by the Haxe compiler's `hxbReader.ml` (`BytesWithPosition`/`read_*`). Multi
	byte integers are little-endian; doubles are stored as the little-endian bit
	pattern of an `Int64`; lengths and pool indices use unsigned LEB128 and
	signed positions use LEB128.

	This is a low-level building block; most users will go through `hxb.Hxb`,
	`hxb.HxbArchive` or `hxb.read.ModuleDecoder` instead.
**/
class ByteReader {
	/** The backing buffer. **/
	public final bytes:Bytes;

	/** Current read cursor, in bytes from the start of `bytes`. **/
	public var position(default, null):Int;

	final end:Int;

	public function new(bytes:Bytes, position:Int = 0, ?length:Int) {
		this.bytes = bytes;
		this.position = position;
		this.end = length == null ? bytes.length : position + length;
	}

	/** Number of bytes left before the configured end. **/
	public inline function remaining():Int {
		return end - position;
	}

	/** `true` when the cursor reached the end of the readable region. **/
	public inline function eof():Bool {
		return position >= end;
	}

	// --- Primitives ---------------------------------------------------------

	/** Read a single unsigned byte (0..255). **/
	public inline function readByte():Int {
		return bytes.get(position++);
	}

	/** Read `length` raw bytes into a fresh `Bytes`. **/
	public function readBytes(length:Int):Bytes {
		final out = bytes.sub(position, length);
		position += length;
		return out;
	}

	/** Read a boolean: any non-zero byte is `true`. **/
	public inline function readBool():Bool {
		return readByte() != 0;
	}

	/**
		Signed 16-bit integer, matching `hxbReader.ml`'s `read_i16`
		(high byte first). Not used by the module format itself but kept for
		parity.
	**/
	public function readI16():Int {
		final ch2 = readByte();
		final ch1 = readByte();
		final n = ch1 | (ch2 << 8);
		return (ch2 & 128) != 0 ? n - 65536 : n;
	}

	/** Little-endian unsigned 16-bit integer (matches `write_ui16`). **/
	public function readUInt16():Int {
		final b0 = readByte();
		final b1 = readByte();
		return b0 | (b1 << 8);
	}

	/**
		Little-endian signed 32-bit integer.

		Delegates to `Bytes.getInt32`, which yields a correctly sign-wrapped
		32-bit value on every target (a hand-rolled `b0 | b3<<24` would not wrap
		on targets whose `Int` is unbounded, e.g. Python).
	**/
	public function readInt32():Int {
		final v = bytes.getInt32(position);
		position += 4;
		return v;
	}

	/** Little-endian signed 64-bit integer (low word first). **/
	public function readInt64():Int64 {
		final low = readInt32();
		final high = readInt32();
		return Int64.make(high, low);
	}

	/** IEEE-754 double, stored as the little-endian bits of an `Int64`. **/
	public function readDouble():Float {
		return FPHelper.i64ToDouble(readInt32(), readInt32());
	}

	/** Unsigned LEB128 integer. **/
	public function readUleb128():Int {
		var result = 0;
		var shift = 0;
		while (true) {
			final b = readByte();
			result = result | ((b & 0x7F) << shift);
			if (b < 0x80)
				break;
			shift += 7;
		}
		return result;
	}

	/** Signed LEB128 integer. **/
	public function readLeb128():Int {
		var result = 0;
		var shift = 0;
		var b = 0;
		while (true) {
			b = readByte();
			result = result | ((b & 0x7F) << shift);
			shift += 7;
			if (b < 0x80)
				break;
		}
		// sign-extend if the sign bit of the last group is set
		if ((b & 0x40) != 0 && shift < 32)
			result = result | (-1 << shift);
		return result;
	}

	/** A raw, length-prefixed UTF-8 string (uleb128 length + bytes). **/
	public function readRawString():String {
		final len = readUleb128();
		final s = bytes.getString(position, len, UTF8);
		position += len;
		return s;
	}

	/** Move the cursor without reading. **/
	public inline function skip(n:Int):Void {
		position += n;
	}
}
