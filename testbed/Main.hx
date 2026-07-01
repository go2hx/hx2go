import haxe.iterators.ArrayIterator;
class Main {

    public static function main(): Void {
        trace("A");
        trace("A", "B");

        var test: Array<Int> = [1, 2, 3];
        var iter = test.iterator();
        printAll(iter);
    }

    public static function printAll<T>(iter: ArrayIterator<T>): Void {
        while (iter.hasNext()) {
            trace(iter.next());
        }
    }

}