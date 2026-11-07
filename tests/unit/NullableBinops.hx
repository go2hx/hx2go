package unit;


function main() {
    var x: Int = 0;
    var x_null: Null<Int> = x;
    assert(x_null == 0);

    var y: Int = 5;
    var y_null: Null<Int> = y;
    assert(y_null == 5);

    var x_null2: Null<Int> = 3;
    var y_null2: Null<Int> = 5;
    var sum = x_null2 + y_null2;
    assert(sum == 8);

    var diff = y_null2 - x_null2;
    assert(diff == 2);

    var prod = x_null2 * y_null2;
    assert(prod == 15);

    var mod = y_null2 % x_null2;
    assert(mod == 2);

    var mixed = x_null2 + 2;
    assert(mixed == 5);

    var assign: Null<Int> = x_null2 + y_null2;
    assert(assign == 8);
}
