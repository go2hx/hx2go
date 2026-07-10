package unit;


function main() {
    var x: Int = 5;
    var x_neg: Int = -x;
    assert(x_neg == -5);

    var x_null: Null<Int> = x;
    var x_null_neg: Null<Int> = -x_null;
    assert(x_null_neg == -5);

    var x_dyn: Dynamic = x;
    var x_dyn_neg: Dynamic = -x_dyn;
    assert(x_dyn_neg == -5);
}
