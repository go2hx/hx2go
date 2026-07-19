package unit;

function main() {
    var x = get() / 2;
    assert(x == 3.5);
}

function get():haxe.Int32 {
    return 7;
}