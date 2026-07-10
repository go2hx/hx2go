package unit;


function main() {
    var sum = (a: Int, b: Int) -> {
        return a + b;
    }

    assert(sum(5, 6) == 11);
    assert(sum(7, 9) == 16);

    var sum_by_10_left = sum.bind(10, _);
    var sum_by_10_right = sum.bind(_, 10);

    assert(sum_by_10_left(5) == 15);
    assert(sum_by_10_right(20) == 30);

    var multiply = (a: Int, b: Int) -> {
        var acc: Int = 0;
        var loopTimes = (x: Int, f: Void->Void) -> {
            var i = 0;
            while (i < x) {
                f();
                i++;
            }
        }

        var addToAccTimes = loopTimes.bind(_, () -> acc += b);
        addToAccTimes(a);

        return acc;
    }

    assert(multiply(19, 8) == 152);
}
