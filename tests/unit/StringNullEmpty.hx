package unit;


function main() {
    var empty:String = "";
    var nul:String = null;
    var nul2:String = null;

    // "" and null are distinct
    assert((empty == null) == false);
    assert((nul == null) == true);
    assert((empty == "") == true);
    assert((nul == "") == false);        // key case: null String is NOT ""
    assert((nul == nul2) == true);       // two nulls are equal
    assert((empty == nul) == false);     // "" is not null, both operand orders
    assert((nul == empty) == false);

    assert(nul != "null");               // String Null should be different from the string "null"

    assert(empty.length == 0);

    // null prints "null", "" prints ""
    assert(Std.string(empty) == "");
    assert(Std.string(nul) == "null");

    // Reflect.isObject: "" is a real string (object), null is not
    assert(Reflect.isObject(empty) == true);
    assert(Reflect.isObject(nul) == false);

    // Reflect.compare
    assert(Reflect.compare(empty, empty) == 0);   // equal empties
    assert(Reflect.compare(nul, nul2) == 0);      // both null -> 0
    assert(Reflect.compare(nul, empty) == -1);    // one null (a) -> -1
    assert(Reflect.compare(empty, nul) == -1);    // one null (b) -> -1
    assert(Reflect.compare(empty, "a") < 0);      // "" < "a", normal ordering

    // Dynamic strings behave identically
    var dEmpty:Dynamic = empty;
    var dNul:Dynamic = nul;
    assert((dEmpty == null) == false);
    assert((dNul == null) == true);
    assert(Std.string(dEmpty) == "");
    assert(Std.string(dNul) == "null");
    assert(Reflect.compare(dNul, dEmpty) == -1);
    assert(Reflect.compare(dEmpty, dEmpty) == 0);
}
