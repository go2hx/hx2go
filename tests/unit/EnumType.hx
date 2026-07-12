package unit;

import go.Syntax;

enum Colour {
    HEX(v: String);
    RGB(r: Float, g: Float, b: Float);
    RGBA(r: Float, g: Float, b: Float, a: Float);
}

function main() {
    var a: Colour = RGBA(1, 0, 0, 1);
    var b: Dynamic = a;

    var f1: Enum<Dynamic> = cast a;
    var f2: Enum<Dynamic> = cast b;

    assert(getName(f1) == "unit.Colour");
    assert(getName(f2) == "unit.Colour");
    assert(getName(Colour) == "unit.Colour");
}

function getName<T>(f: Enum<T>): String {
    return Syntax.code("{0}.Hx_Field_name", f);
}