import go.fmt.Fmt;

class Main {

    public static function main() {
        var x: Int = 5;
        var x_null: Null<Int> = x;
        var x_dyn: Dynamic = x;

        var y: Bool = true;
        var y_null: Null<Bool> = y;
        var y_dyn: Dynamic = y;

        Fmt.println(-x, -x_null, -x_dyn);
        Fmt.println(!y, !y_null, !y_dyn);
        Fmt.println(~x, ~x_null, ~x_dyn);
        Fmt.println(x++, x_null++, x_dyn++);
        Fmt.println(++x, ++x_null, ++x_dyn);
        Fmt.println(x--, x_null--, x_dyn--);
        Fmt.println(--x, --x_null, --x_dyn);
    }

}