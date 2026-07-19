function test(...a:Int): haxe.Rest<Int> {
    return a;
}

function foo(...a:haxe.Rest<Int>): Void {
    trace(a);
}

function main() {
    var x = test(1, 2, 3);
    foo(x);
}