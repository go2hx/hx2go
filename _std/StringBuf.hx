import go.strings.Builder;

class StringBuf {
    var b:Builder;

    public var length(get, never):Int;
    public inline function new() {
        var b: Builder = null;
        this.b = b;
    }

    inline function get_length():Int {
        return b.len();
    }

    public inline function add<T>(x:T):Void {
        b.writeString(Std.string(x));
    }

    public inline function addChar(c:Int):Void {
        add(String.fromCharCode(c));
    }

    public inline function addSub(s:String, pos:Int, ?len:Int):Void {
        add(len == null ? s.substr(pos) : s.substr(pos, len));
    }

    public inline function clear():Void {
        b.reset();
    }

    public inline function toString():String {
        return b.string();
    }

}