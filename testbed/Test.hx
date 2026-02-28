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
//            x++;
//        }
//
//        function print() {
//            Sys.println(x);
//        }

        return {inc: inc, print: print};
    }

    static function main() {
        var a = cap();
        var b = cap();

        // a.print();
        // b.print();

        // a.inc();

        // a.print();
        // b.print();

        // b.inc();

        // a.print();
        // b.print();
    }
}