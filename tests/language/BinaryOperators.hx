package language;

function run() {
    trace("Binary Operators\n");

    // Arithmetic
    assert(10 + 3, 13);
    assert(10 - 3, 7);
    assert(10 * 3, 30);
    assert(10 % 3, 1);

    // Comparison
    assert(5 == 5, true);
    assert(5 != 3, true);
    assert(3 < 5, true);
    assert(5 > 3, true);
    assert(3 <= 3, true);
    assert(5 >= 5, true);

    // Logical
    assert(true && false, false);
    assert(true || false, true);

    // Bitwise
    assert(5 & 3, 1);
    assert(5 | 3, 7);
    assert(5 ^ 3, 6);
    assert(5 << 1, 10);
    assert(5 >> 1, 2);
}
