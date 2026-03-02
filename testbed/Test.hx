@:analyzer(ignore)
class Test {

    public static function main() {
        var i = 0;
        var arr = [i, ++i, ++i];

        for (x in arr.iterator()) {
            Sys.println(x);
        }

        for (x in arr.keyValueIterator()) {
            Sys.println(x);
        }
    }

}