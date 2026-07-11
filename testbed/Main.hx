import go.fmt.Fmt;
import haxe.Rest;

function main() {
    var x = [10,11];
    foo(10, 10, 11, 12);
    foo(10, ...x);
}

function foo(x: Int, y: Rest<Int>) {
    Fmt.println(...y);
    bar(y);
    bar(...y);
}

function bar(v: Rest<Dynamic>): Void {
    trace(v);
}