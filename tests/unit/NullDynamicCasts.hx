package unit;


function main() {
    var z: Int = 3;
    var z_null: Null<Int> = z;
    var z_dyn: Dynamic = z_null;

    assert(z_dyn == 3);

    var z_dyn_int: Int = z_dyn;
    assert(z_dyn_int == 3);

    var z_dyn_null_int: Null<Int> = z_dyn;
    assert(z_dyn_null_int == 3);
    assert(z_dyn_null_int != null);

    z_null = null;
    z_dyn = z_null;
    assert(z_dyn == null);

    z_dyn_int = z_dyn;
    z_dyn_null_int = z_dyn;
    assert(z_dyn_null_int == null);
}
