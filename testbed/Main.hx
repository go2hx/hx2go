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
        trace("Foo");
    }

    public dynamic function bar() {
        trace("Bar");
    }

}

class Bar extends Foo {

    public dynamic function baz(): Void {
        trace("Baz");
    }

}

function main() {
    haxe.Log.trace = (v: Dynamic, ?posInfos: PosInfos) -> {
        Sys.println('overwritten :D -> ' + haxe.Log.formatOutput(v, posInfos));
    }

    var c1: Colour = Red;
    var c2: Colour = RGBA(1, 0, 0, 1);
    var c3: EnumValue = c2;

    trace(c1, c2, c3);

    var v = new Foo();
    var v2 = new Bar();

    Foo.foo();
    v.bar();
    v2.bar();
    v2.baz();

    Foo.foo = () -> {
        trace('overwritten Foo on Static');
    }

    v.bar = () -> {
        trace('overwritten Bar on Foo');
    }

    v2.bar = () -> {
        trace('overwritten Bar on Bar');
    }

    v2.baz = () -> {
        trace("overwritten Baz on Bar");
    }

    Foo.foo();
    v.bar();
    v2.bar();
    v2.baz();
}