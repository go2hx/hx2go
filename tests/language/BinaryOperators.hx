package language;

function run() {
    trace("Binary Operators\n");

    // Arithmetic
    equals(10 + 3, 13);
    equals(10 - 3, 7);
    equals(10 * 3, 30);
    equals(10 % 3, 1);

    // Comparison
    equals(5 == 5, true);
    equals(5 != 3, true);
    equals(3 < 5, true);
    equals(5 > 3, true);
    equals(3 <= 3, true);
    equals(5 >= 5, true);

    // Logical
    equals(true && false, false);
    equals(true || false, true);

    // Bitwise
    equals(5 & 3, 1);
    equals(5 | 3, 7);
    equals(5 ^ 3, 6);
    equals(5 << 1, 10);
    equals(5 >> 1, 2);
}
