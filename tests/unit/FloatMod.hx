package unit;

function main() {
    assert(10.3 % 3 == 1.3000000000000007);
    assert(-101.5 % 100 == -1.5);
    assert(fromFloat(10.5) == 10);

    var x = fromFloat(10.3);
    x %= 3;
    assert(x == 1);

    var f:Float = 7.5;
    f %= 2.0;
    assert(f == 1.5);

    var a:Array<Float> = [7.5];
    a[0] %= 2.0;
    assert(a[0] == 1.5);

    var d:Dynamic = [-101.5];
    d[0] %= 100;
    assert(d[0] == -1.5);

    var d2:Dynamic = [7.5];
    d2[0] %= 2.0;
    assert(d2[0] == 1.5);

    var o:Dynamic = { f: 7.5 };
    o.f %= 2.0;
    assert(o.f == 1.5);

    var l:Dynamic = 7.5;
    var r:Dynamic = 2;
    assert(l % r == 1.5);

    var li:Dynamic = 7;
    var ri:Dynamic = 3;
    assert(li % ri == 1);
}

function fromFloat(f:Float) {
    var noFractions = f - (f % 1);
    return noFractions;
}