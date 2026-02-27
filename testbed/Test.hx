import go.Fmt;
import runtime.HxDynamic;

@:analyzer(ignore)
class Test {

    public static function main() {
        var x = 5;
        var y = 10;

        var x_dyn: Dynamic = x;
        var y_dyn: Dynamic = y;

        Fmt.println(x_dyn > y_dyn);
        Fmt.println(x_dyn < y_dyn);
        Fmt.println(x_dyn == y_dyn);
        Fmt.println(x_dyn + y_dyn);
        Fmt.println(x_dyn - y_dyn);

        var z = 20;
        var z_dyn: Dynamic = z;

        Fmt.println(x_dyn + y_dyn * z_dyn);
    }

}
