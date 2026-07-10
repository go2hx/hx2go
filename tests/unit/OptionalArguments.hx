package unit;


function main() {
    assert(doStuff(10, 40) == 50.0);
    assert(doStuff(10, 40, 10) == 500.0);
}

function doStuff(a, b, ?c): Float {
    return c == null ? a + b : (a + b) * c;
}
