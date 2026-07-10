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

    trace(c1, c2, c3);
}
