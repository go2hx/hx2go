package unit;

function main() {
    var TYPES:Array<Dynamic> = [Int, Float];

    var v:Dynamic = 2.0;
    var t1:Dynamic = Int;
    var t2:Dynamic = Float;

    for (i in 0...TYPES.length) {
        var c:Dynamic = TYPES[i];
        var want = c != null && (c == t1 || c == t2) || (c == Dynamic);
        assert(Std.isOfType(v, c) == want);
    }

    // non whole number Float must not be of type Int
    assert(Std.isOfType(2.5, Int) == false);
}
