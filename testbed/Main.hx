import go.fmt.Fmt;

class Main {

    public static function max<T: Float>(a: T, b: T): T {
        return if (a > b) a else b;
    }

    public static function main() {
        var x = max(2, 1);
//        trace(max(1, 3));
//        trace(max(10.1, 19.5));
//        trace(max(109.4, 13));
    }

}