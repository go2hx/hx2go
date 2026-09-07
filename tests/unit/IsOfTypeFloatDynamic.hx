package unit;

function main() {
    assert(Std.isOfType(0, Float) == true);
    assert(Std.isOfType(-1, Float) == true);

    assert(Std.isOfType(0, Dynamic) == true);
    assert(Std.isOfType(1.2, Dynamic) == true);
    assert(Std.isOfType("x", Dynamic) == true);
    assert(Std.isOfType(true, Dynamic) == true);

    var tFloat:Dynamic = Float;
    var tDynamic:Dynamic = Dynamic;
    assert(Std.isOfType(0, tFloat) == true);
    assert(Std.isOfType(0, tDynamic) == true);

    assert(Std.isOfType(1.2, Int) == false);
}
