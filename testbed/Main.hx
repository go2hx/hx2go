class Main {

    public static function main() {
        var x: Int = 3;
        var y: Int = 5;
        var x_null: Null<Int> = x;
        var y_null: Null<Int> = y;

        var test_a = x + y_null;
        var test_b = x_null + y;
        var test_c = x_null + y_null;
        var test_d = x + y;
    }

}