class Instance {

    public var x: Float;

    public function new() {
        x = 4.0;
    }

    public function inc(by: Float) {
        x += by;
    }
}

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

    static function foo(x: Int): { double: Int, half: Float } {
        return {
            double: x * 2,
            half: x / 2
        }
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

        var dyn = Test.foo;
        var dyn_res = dyn(5);
        Sys.println(dyn_res.double);
        Sys.println(dyn_res.half);
        Sys.println(Test.foo(5));
        Test.foo(5);

        var dyn_bound = Test.foo.bind(10);
        var dyn_bound_res = dyn_bound();
        Sys.println(dyn_bound_res.double);
        Sys.println(dyn_bound_res.half);
        Sys.println(Test.foo.bind(10)());
        Test.foo.bind(10)();

        var instanceA = new Instance();
        var instanceB = new Instance();

        instanceA.inc(1);
        instanceB.inc(1);

        var dyn_inst_a = instanceA.inc;
        var dyn_inst_b = instanceB.inc;

        Sys.println(instanceA.x);
        Sys.println(instanceB.x);

        dyn_inst_a(1);

        Sys.println(instanceA.x);
        Sys.println(instanceB.x);

        dyn_inst_b(1);

        Sys.println(instanceA.x);
        Sys.println(instanceB.x);

        var f: Array<Void->Void> = [];

        for (i in 0...3) {
            f.push(() -> Sys.println(i));
        }

        for (fn in f) {
            fn();
        }

    }
}