package unit;
import go.Syntax;

function main() {
    var bar: Bar = new Bar();
    var foo: Foo = bar;
    var dyn: Dynamic = bar;

    var f1: Class<Dynamic> = cast bar;
    var f2: Class<Dynamic> = cast foo;
    var f3: Class<Dynamic> = cast dyn;

    assert(getName(f1) == "unit._ClassType.Bar");
    assert(getName(f2) == "unit._ClassType.Bar");
    assert(getName(f3) == "unit._ClassType.Bar");
    assert(getName(Foo) == "unit._ClassType.Foo");
    assert(getName(Bar) == "unit._ClassType.Bar");
}

function getName<T>(f: Class<T>): String {
    return Syntax.code("{0}.Hx_Field_name", f);
}

private class Foo {
    public function new() {}
}

private class Bar extends Foo {}