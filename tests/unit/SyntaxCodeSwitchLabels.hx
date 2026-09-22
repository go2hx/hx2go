package unit;

import go.Syntax;

function classify(x:Int):String {
    var s = "";
    Syntax.code("switch {0} {", x);
    Syntax.code("case 1, 2:");
        s = "low";
    Syntax.code("case 3:");
        s = "three";
    Syntax.code("default:");
        s = "other";
    Syntax.code("}");
    return s;
}

function main() {
    assert(classify(1) == "low");
    assert(classify(2) == "low");
    assert(classify(3) == "three");
    assert(classify(9) == "other");
}
