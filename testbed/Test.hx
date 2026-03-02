@:analyzer(ignore)
class Test {

    public static function main() {
        var i = 0;
        var arr = [i, ++i, ++i, ++i, ++i, ++i];

        for (x in arr.iterator()) {
            Sys.println(x);
        }

        for (x in arr.keyValueIterator()) {
            Sys.println(x);
        }

        for (x in arr.map(x -> 'item $x')) {
            Sys.println(x);
        }

        for (x in arr.filter(x -> x % 2 == 0)) {
            Sys.println(x);
        }

        arr.sort((a, b) -> b - a);

        for (x in arr.iterator()) {
            Sys.println(x);
        }

        Sys.println("initial length: " + arr.length);
        arr.resize(100);
        Sys.println("resized length: " + arr.length);
        arr.resize(3);
        Sys.println("resized length: " + arr.length);

        for (x in arr.iterator()) {
            Sys.println(x);
        }

        arr = new Array();
        arr.push(10);
        arr.push(20);

        for (x in arr.iterator()) {
            Sys.println(x);
        }
    }

}