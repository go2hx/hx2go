import go.fmt.Fmt;
import haxe.PosInfos;

private enum Colour {
    Red;
    Green;
    Blue;
    RGBA(r: Float, g: Float, b: Float, a: Float);
}

class Foo {

    public function new() {}

    public static dynamic function foo() {
        Fmt.println("Foo");
    }

    public dynamic function bar() {
        Fmt.println("Bar");
    }

}

function main() {
    haxe.Log.trace = (v: Dynamic, ?posInfos: PosInfos) -> {
        Sys.println('overwritten :D -> ' + haxe.Log.formatOutput(v, posInfos));
    }

    var c1: Colour = Red;
    var c2: Colour = RGBA(1, 0, 0, 1);
    var c3: EnumValue = c2;

    Fmt.println(c1, c2, c3);

    var v = new Foo();

    Foo.foo();
    v.bar();

    Foo.foo = () -> {
        Fmt.println('overwritten Foo');
    }

//    v.bar = () -> {
//        Fmt.println('overwritten Bar');
//    }

    Foo.foo();
    v.bar();
}