package unit;


function main() {
    var x = max(2, 1);
    assert(x == 2);

    var y = max(10.1, 19.5);
    assert(y == 19.5);
}

function max<T: Float>(a: T, b: T): T {
    return if (a > b) a else b;
}
