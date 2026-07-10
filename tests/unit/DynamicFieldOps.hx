package unit;


function main() {
    var prim_i: Int = 5;
    var dyn_prim_i: Dynamic = prim_i;
    var prim_b: Bool = false;
    var dyn_prim_b: Dynamic = prim_b;

    var values: Dynamic = {
        prim_b: false,
        prim_i: 5,
        null_b: (null : Null<Bool>),
        null_i: (null : Null<Int>)
    };

    assert(values.prim_i == 5);
    assert(values.prim_b == false);
    assert(values.null_i == null);

    values.prim_i++;
    assert(values.prim_i == 6);

    ++values.prim_i;
    assert(values.prim_i == 7);

    values.prim_i += 10;
    assert(values.prim_i == 17);

    values.null_b = true;
    assert(values.null_b == true);
}
