package unit;

function main() {
    var n: Null<Int> = 5;
    assert(Std.string(n) == "5");

    var z: Null<Int> = null;
    assert(Std.string(z) == "null");

    var s: Null<String> = "hi";
    assert(Std.string(s) == "hi");

    var b: Null<Bool> = true;
    assert(Std.string(b) == "true");

    var f: Null<Float> = 2.5;
    assert(Std.string(f) == "2.5");

    var arr = [10, 20, 30];
    assert(Std.string(arr.pop()) == "30");
    assert(Std.string(arr.shift()) == "10");

    assert('${n}' == "5");
}
