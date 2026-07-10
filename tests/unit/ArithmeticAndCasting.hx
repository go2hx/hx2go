package unit;


function main() {
    var a: Int = 3;
    var b: Float = 5.5;

    var sum = a + b;
    assert(sum == 8.5);

    var intSum: Int = a + a;
    assert(intSum == 6);

    var floatSum: Float = b + b;
    assert(floatSum == 11.0);

    var diff = b - a;
    assert(diff == 2.5);

    var product = a * b;
    assert(product == 16.5);
}
