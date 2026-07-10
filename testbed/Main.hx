import hx2go.hxb.Typed.HxbTypedExpr;

class Foo {

    public var x: Int = 5;

    public function new() {}

    public function toString() {
        return 'foo: $x';
    }

}
function main() {
    var x = new Foo();
    trace(x);

//    var t: HxbTypedExpr = new HxbTypedExpr(TBlock([]), null, null);
//    trace(t);
}