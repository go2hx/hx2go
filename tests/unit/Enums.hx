package unit;


private enum Colour {
    Red;
    Green;
    Blue;
    RGBA(r: Float, g: Float, b: Float, a: Float);
}

function main() {
    var c1: Colour = Red;
    var c2: Colour = RGBA(1, 0, 0, 1);
    var c3: EnumValue = c2;

    assert(c2 != c1);
    assert(c2 == c3);
}
