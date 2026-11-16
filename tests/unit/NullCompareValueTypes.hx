package unit;

private inline function isNull<T>(value:Null<T>):Bool {
    return value == null;
}

function main() {
    var i:Int = 0;
    var u:UInt = 0;
    var f:Float = 0.5;
    var b:Bool = false;
    var s:String = "text";
    var ns:String = null;

    assert(!isNull(i));
    assert(!isNull(u));
    assert(!isNull(f));
    assert(!isNull(b));
    assert(!isNull(s));
    assert(isNull(ns));
}
