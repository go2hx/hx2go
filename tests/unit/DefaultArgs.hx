package unit;



function main() {
    var x:Null<Int> = get();
    x += 2;
    assert(x == 12);
    assert(def2() == 3); // 3
    assert(def() == 2); // 2
    assert(def(3) == 3); // 3
}

function def(?value:Int=2) {
    return value;
}

function def2(value:Int=3) {
    return value;
}

function get()
    return 10;