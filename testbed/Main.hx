//import haxe.Http;
//
//function main() {
//    trace(
//        Http.requestUrl("http://raw.githubusercontent.com/go2hx/hx2go/refs/heads/main/README.md")
//    );
//}

@:structInit
class Foo {
    public var v:Int = 0;

    public dynamic function log(mul: Float) {
        trace("Value is", this.v * mul);
    }
}

class Main {
    static function main() {
        var a: Foo = { v : 1 };
        var b: Foo = { v : 2 };

        a.log(2);
        b.log(2);
        a.log = b.log;
        a.log(2);
        b.log(2);
    }
}
