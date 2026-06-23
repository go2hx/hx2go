class Main {

    public static function main() {
        var x: Int = 5;
        var x_null: Null<Int> = x;
        Sys.println('x_null is null? ' + (x_null == null));
        var x_int: Int = x;
        Sys.println('x value was ' + x + ' now ' + x_int);
        x_null = null;
        Sys.println('nullable x is ' + x_null);
        x_int = x_null;
        Sys.println('x value is now ' + x_int);

        var y: Int = 0;
        var y_null: Null<Int> = y;
        Sys.println('y_null is null? ' + (y_null == null));
        Sys.println('nullable y is ' + y_null);
        var y_int: Int = y;
        Sys.println('y value is ' + y_int);

        var y_float: Float = y_null;
        Sys.println('nullable y casted to float is ' + y_float);
        var y_null_float: Null<Float> = y_null;
        Sys.println('nullable y casted to nullable float is ' + y_null_float);

        var z: Int = 3;
        var z_null: Null<Int> = z;
        var z_dyn: Dynamic = z_null;
        Sys.println('z_dyn is null? ' + (z_dyn == null));

        var z_dyn_int: Int = z_dyn;
        Sys.println('z_dyn_int value ' + z_dyn_int);

        var z_dyn_null_int: Null<Int> = z_dyn;
        Sys.println('z_dyn_null_int value' + z_dyn_null_int);
    }

}