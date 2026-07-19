package haxe.io;

import haxe.Int32;


// Shadowed because Haxe's analyzer has a  "local variable used without being initialized"
// error for `getBytes` when using untyped

class BytesBuffer {
    var b: BytesData;

    /** The length of the buffer in bytes. **/
    public var length(get, never): Int;

    public function new() {
        b = [];
    }

    inline function get_length(): Int {
        return b.length;
    }

    public inline function addByte(byte: Int) {
        b.push(byte);
    }

    public inline function add(src: Bytes) {
        var b2 = src.getData();
        for (i in 0...src.length)
            b.push(b2[i]);
    }

    public inline function addString(v: String, ?encoding: Encoding) {
        add(Bytes.ofString(v, encoding));
    }

    public inline function addInt32(v: Int32) {
        addByte(v & 0xFF);
        addByte((v >> 8) & 0xFF);
        addByte((v >> 16) & 0xFF);
        addByte(v >>> 24);
    }

    public inline function addInt64(v: haxe.Int64) {
        addInt32(v.low);
        addInt32(v.high);
    }

    public inline function addFloat(v: Float) {
        addInt32(FPHelper.floatToI32(v));
    }

    public inline function addDouble(v: Float) {
        addInt64(FPHelper.doubleToI64(v));
    }

    public inline function addBytes(src: Bytes, pos: Int, len: Int) {
        if (pos < 0 || len < 0 || pos + len > src.length)
            throw Error.OutsideBounds;

        var b2 = src.getData();
        for (i in pos...pos + len)
            b.push(b2[i]);
    }
    public function getBytes(): Bytes {
        var bytes = Bytes.ofData(b);
        b = null;
        return bytes;
    }

}
