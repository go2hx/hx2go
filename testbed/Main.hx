import go.fmt.Fmt;

class Main {

    public static function main() {
        var i: Int = 32;
        var i_dyn: Dynamic = i;
        var sum = i + i_dyn;
        var mut = sum * i_dyn;

        i_dyn *= mut;

        Fmt.println(i, i_dyn, sum, mut);
    }

}