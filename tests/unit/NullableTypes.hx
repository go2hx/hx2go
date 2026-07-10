package unit;


function main() {
    var x: Int = 0;
    var x_null: Null<Int> = x;
    assert(x_null == 0);
    assert(x_null != null);

    var x_int: Int = x;
    assert(x_int == 0);

    x_null = null;
    assert(x_null == null);

    var y: Int = 5;
    var y_null: Null<Int> = y;
    assert(y_null == 5);
    assert(y_null != null);

    var y_float: Float = y_null;
    assert(y_float == 5.0);

    var y_null_float: Null<Float> = y_null;
    assert(y_null_float == 5.0);

    y_null = null;
    var y_int: Int = y;
    assert(y_int == 5);
}
