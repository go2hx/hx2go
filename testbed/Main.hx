import go.fmt.Fmt;
class Main {

//    public static function max<T: Float>(a: T, b: T): T {
//        return if (a > b) a else b;
//    }

    public static function main() {
//        Sys.println(max(1, 3));
//        Sys.println(max(10.1, 19.5));

        var x: Int = 5;
        var x_null: Null<Int> = x;
        var x_dyn: Dynamic = x;

        var x_neg: Int = -x;
        var x_null_neg_a: Null<Int> = -x_null;
        var x_null_neg_b: Int = -x_null;
        var x_dyn_neg: Dynamic = -x_dyn;

        Fmt.println(x, x_neg, x_null_neg_a, x_null_neg_b, x_dyn_neg);
    }

}