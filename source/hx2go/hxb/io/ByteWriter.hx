package hx2go.hxb.io;

import haxe.Int64;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import haxe.io.Encoding;
import haxe.io.FPHelper;

/**
	A growable byte sink whose primitives are the exact inverse of
	`hxb.io.ByteReader`, mirroring the Haxe compiler's `hxbWriter.ml`
	(`Chunk`/`SimnBuffer`/`write_*`).

	Integers are little-endian, doubles use the little-endian `Int64` bit
	pattern, lengths/indices use unsigned LEB128 and positions use signed
	LEB128.
**/
class ByteWriter {
	final buffer:BytesBuffer;

	public function new() {
		buffer = new BytesBuffer();
	}

	/** Number of bytes written so far. **/
	public var length(get, never):Int;

	inline function get_length():Int
		return buffer.length;

	// --- Primitives ---------------------------------------------------------

	/** Write a single byte (only the low 8 bits are used). **/
	public inline function writeByte(v:Int):Void {
		buffer.addByte(v & 0xFF);
	}

	/** Append raw bytes. **/
	public inline function writeBytes(b:Bytes):Void {
		buffer.add(b);
	}

	/** Append a sub-range of raw bytes. **/
	public inline function writeFullBytes(b:Bytes, pos:Int, len:Int):Void {
		buffer.addBytes(b, pos, len);
	}

	/** Write a boolean as a single `0`/`1` byte. **/
	public inline function writeBool(b:Bool):Void {
		writeByte(b ? 1 : 0);
	}

	/** Little-endian unsigned 16-bit integer. **/
	public function writeUInt16(v:Int):Void {
		writeByte(v);
		writeByte(v >> 8);
	}

	/** Little-endian signed 32-bit integer. **/
	public function writeInt32(v:Int):Void {
		writeByte(v);
		writeByte(v >> 8);
		writeByte(v >> 16);
		writeByte(v >>> 24);
	}

	/** Little-endian signed 64-bit integer (low word first). **/
	public function writeInt64(v:Int64):Void {
		writeInt32(v.low);
		writeInt32(v.high);
	}

	/** IEEE-754 double, stored as the little-endian bits of an `Int64`. **/
	public function writeDouble(f:Float):Void {
		writeInt64(FPHelper.doubleToI64(f));
	}

	/** Unsigned LEB128 integer. **/
	public function writeUleb128(v:Int):Void {
		var value = v;
		while (true) {
			final b = value & 0x7F;
			value = value >>> 7;
			if (value == 0) {
				writeByte(b);
				break;
			} else {
				writeByte(b | 0x80);
			}
		}
	}

	/** Signed LEB128 integer. **/
	public function writeLeb128(v:Int):Void {
		var value = v;
		while (true) {
			final b = value & 0x7F;
			value = value >> 7;
			if ((value == 0 && (b & 0x40) == 0) || (value == -1 && (b & 0x40) == 0x40)) {
				writeByte(b);
				break;
			} else {
				writeByte(b | 0x80);
			}
		}
	}

	/** A raw, length-prefixed UTF-8 string (uleb128 length + bytes). **/
	public function writeRawString(s:String):Void {
		final b = Bytes.ofString(s, UTF8);
		writeUleb128(b.length);
		writeBytes(b);
	}

	/** Finalize and return the accumulated bytes. The writer must not be used afterwards. **/
	public function getBytes():Bytes {
		return buffer.getBytes();
	}
}
