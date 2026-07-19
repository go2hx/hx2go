package unit;

function test(...a:Int): haxe.Rest<Int> {
    return a;
}

function foo(...a:haxe.Rest<Int>): Void {
    var v = a[0];
    assert(v[0] == 1 && v[1] == 2 && v[2] == 3);
}

function main() {
    var x = test(1, 2, 3);
    foo(x);
}