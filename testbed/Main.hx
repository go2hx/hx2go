enum Colour {
    Red;
    Green;
    Blue;
    RGBA(r: Float, g: Float, b: Float, a: Float);
}

function main() {
    var c1 = Red;
    var c2 = RGBA(1, 0, 0, 1);

    trace(c1, c2);
}