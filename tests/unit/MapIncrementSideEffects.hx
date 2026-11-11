package unit;

private var state = 0;

private function getKey():String {
    state++;
    return "hello";
}

function main() {
    var m = ["hello" => 0];

    var x = m[getKey()]++;
    assert(x == 0);
    assert(state == 1);
    assert(m["hello"] == 1);

    var y = ++m[getKey()];
    assert(y == 2);
    assert(state == 2);
    assert(m["hello"] == 2);

    var z = m[getKey()]--;
    assert(z == 2);
    assert(state == 3);
    assert(m["hello"] == 1);

    var w = --m[getKey()];
    assert(w == 0);
    assert(state == 4);
    assert(m["hello"] == 0);
}
