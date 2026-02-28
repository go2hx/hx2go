@:analyzer(ignore)
class Test {
    static function cap():{incV:Float->Void, incI: Int->Float, incF: Float->Float, print:Void->Void} {
        var x = 5.0;

        var inc = (by: Float) -> {
            x += by;
        }
        var print = () -> {
            Sys.println(x);
        }

//        function inc() {
//            return x++;
//        }
//
//        function print() {
//            Sys.println(x);
//        }

        return {incV: inc, incI: inc, incF: inc, print: print};
    }

    static function test() {
        return { a: 3 };
    }

    static function main() {
        var a = cap();
        var b = cap();
        var c = test();

        Sys.println(c.a);
        a.print();
        b.print();

        a.incI(1);

        a.print();
        b.print();

        b.incF(1);

        a.print();
        b.print();

        var count = 100;
        var foo = (a, b) -> a + b;
        var bar = foo.bind(count, _);

        Sys.println(bar(100));
        count = 200;
        Sys.println(bar(100)); // should still be 200, not 300

        var dyn = Test.test;
        var dyn_res = dyn();
        Sys.println(dyn_res.a);
    }
}