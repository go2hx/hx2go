package unit;


function main() {
    var obj = {
        int: 1,
        float: 2.3,
        string: "Hello",
        bool: false,
        nest: {
            int_nested: 5,
            bool_nested: true
        }
    };

    assert(obj.int == 1);
    assert(obj.float == 2.3);
    assert(obj.string == "Hello");
    assert(obj.bool == false);
    assert(obj.nest.int_nested == 5);
    assert(obj.nest.bool_nested == true);

    var as_dyn: Dynamic = obj;
    assert(as_dyn.int == 1);
    assert(as_dyn.float == 2.3);
    assert(as_dyn.string == "Hello");
    assert(as_dyn.bool == false);
    assert(as_dyn.nest.int_nested == 5);
    assert(as_dyn.nest.bool_nested == true);
}
