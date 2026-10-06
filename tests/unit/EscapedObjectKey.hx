package unit;

function main() {
    var value = {"a\n b": 1};
    assert(Reflect.field(value, "a\n b") == 1);
}
