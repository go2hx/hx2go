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

    var v1 = v.prepend(-1000);
    var v2 = v.append(1000);

    trace(v, v1, v2);
}