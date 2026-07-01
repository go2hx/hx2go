import haxe.iterators.ArrayIterator;
import go.fmt.Fmt;

class Main {

    public static function main(): Void {
        trace("A");
        trace("A", "B");

        var test: Array<Int> = [1, 2, 3];
        var iter = test.iterator();
        printAll(iter);

        var test_dyn_arr: Array<Dynamic> = test;
        var test_dyn_obj: Dynamic = test;
        Fmt.println(test_dyn_arr, test_dyn_obj);

        var test_null_dyn_arr: Null<Array<Dynamic>> = test;
        var test_dyn_null_arr: Array<Null<Dynamic>> = test;
        var test_null_dyn_obj: Null<Dynamic> = test;
        Fmt.println(test_null_dyn_arr, test_dyn_null_arr, test_null_dyn_obj);
    }

    public static function printAll<T>(iter: ArrayIterator<T>): Void {
        while (iter.hasNext()) {
            trace(iter.next());
        }
    }

}