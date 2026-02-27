import go.Fmt;

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
        Fmt.println(x_dyn, -x_dyn);

        var w = true;
        var w_dyn: Dynamic = w;

        Fmt.println(w_dyn, !w_dyn);

        y_dyn += x_dyn;
        y_dyn += 5;
        y_dyn += 3.0;
        y_dyn++;
        ++y_dyn;

        Fmt.println(y_dyn--);
        Fmt.println(--y_dyn);

        Fmt.println(x_dyn, x_dyn << 3);
        Fmt.println(x_dyn, x_dyn >> 2);

        Fmt.println(w_dyn && false);
        Fmt.println(w_dyn || false);
        Fmt.println(w_dyn && true);
        Fmt.println(w_dyn || true);

        Fmt.println(x_dyn == 5);
        Fmt.println(x_dyn != 5);
    }

}
