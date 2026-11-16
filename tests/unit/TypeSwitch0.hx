package unit;

import go.Syntax;

function main() {
    var v: Any = 42;
    var tag = "";
    Syntax.typeSwitch(v,
        TypeSwitch.typeCase((s: String) -> { tag = "string"; }),
        TypeSwitch.typeCase((i: Int) -> { tag = "int"; }),
        TypeSwitch.defaultCase((d: Dynamic) -> { tag = "other"; })
    );
    assert(tag == "int");

    var v2: Any = "hi";
    Syntax.typeSwitch(v2,
        TypeSwitch.typeCase((s: String) -> { tag = "string"; }),
        TypeSwitch.typeCase((i: Int) -> { tag = "int"; }),
        TypeSwitch.defaultCase((d: Dynamic) -> { tag = "other"; })
    );
    assert(tag == "string");

    var v3: Any = true;
    Syntax.typeSwitch(v3,
        TypeSwitch.typeCase((s: String) -> { tag = "string"; }),
        TypeSwitch.typeCase((i: Int) -> { tag = "int"; }),
        TypeSwitch.defaultCase((d: Dynamic) -> { tag = "other"; })
    );
    assert(tag == "other");
}
