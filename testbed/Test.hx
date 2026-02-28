// @:analyzer(ignore)
class Test {
    static function cap():{inc:Void->Void, print:Void->Void} {
        var x = 5;

        var inc = () -> {
            x++;
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

        return {inc: inc, print: print};
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

        a.inc();

        a.print();
        b.print();

        b.inc();

        a.print();
        b.print();
    }
}