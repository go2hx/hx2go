import go.Slice;
class Main {

    public static function foo(x: Int): { double: Int, half: Float } {
        return {
            double: x * 2,
            half: x / 2
        }
    }

    public static function makeCounter(): Void->Int {
        var x = 0;
        return () -> ++x;
    }

    public static function main() {
        var sum = (a: Int, b: Int) -> {
            return a + b;
        }

        Sys.println(sum(5, 6));
        Sys.println(sum(7, 9));

        var sum_by_10_left = sum.bind(10, _);
        var sum_by_10_right = sum.bind(_, 10);

        Sys.println(sum_by_10_left(5));
        Sys.println(sum_by_10_right(20));

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

            return acc; // TODO: try with just "acc" and no return
        }

        Sys.println(multiply(19, 8));

        var dyn = Main.foo;
        var dyn_res = dyn(5);
        Sys.println(dyn_res.double);
        Sys.println(dyn_res.half);
        Sys.println(Main.foo(5));
        Main.foo(5);

        var dyn_bound = Main.foo.bind(10);
        var dyn_bound_res = dyn_bound();
        Sys.println(dyn_bound_res.double);
        Sys.println(dyn_bound_res.half);
        Sys.println(Main.foo.bind(10)());
        Main.foo.bind(10)();

        var items: Slice<Void->Void> = new Slice();

        for (i in 0...untyped __go__("3")) {
            items = items.append(() -> Sys.println('index is: ' + i));
        }

        for (i in 0...items.length) {
            items[i]();
        }

        var count_a = makeCounter();
        var count_b = makeCounter();

        Sys.println(count_a());
        Sys.println(count_a());
        Sys.println(count_b());
        Sys.println(count_b());

        var f_sub = (a: Float, b: Float) -> {
            return a - b;
        }

        var i_sub: (Int, Int) -> Float = f_sub;

        Sys.println(f_sub(10.8, 0.7));
        Sys.println(i_sub(10, 1));

    }

}