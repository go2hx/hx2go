package unit;


function main() {
    var a: Int = 3;
    var b: Float = 5.0;
    var sum: Float = a + b;

    var branch = 0;
    if (sum > 5) {
        branch = 1;
    } else if (sum < 3) {
        branch = 2;
    } else {
        branch = 3;
    }
    assert(branch == 1);

    var count = 0;
    var s: Float = 8.0;
    while (s > 0) {
        s = s - 1;
        count++;
    }
    assert(count == 8);
    assert(s == 0.0);
}
