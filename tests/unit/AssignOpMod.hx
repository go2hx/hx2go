package unit;
function main() {
    var x:Float = 7.5;
    x %= 2.0;
    assert(x == 1.5);
    var z:Float = 5.0;
    z %= 0.0;
    assert(Math.isNaN(z));
    var i:Int = 7;
    i %= 3;
    assert(i == 1);
    var a:Array<Float> = [7.5];
    a[0] %= 2.0;
    assert(a[0] == 1.5);
}
