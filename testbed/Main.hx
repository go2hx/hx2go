import go.fmt.Fmt;

class Main {

    public static function max<T : Float>(a: T, b: T): T {
        var foo: T = a > b ? a : b;
        var bar: Null<T> = foo;

        return bar;
    }

    public static function main() {
        trace(max(1, 3));
        trace(max(10.1, 19.5));
        trace(max(109.4, 13));
    }

}