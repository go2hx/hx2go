package unit;

function main() {
    assert((10 : haxe.Int64).toString() == "10");
    assert(haxe.Int64Helper.parseString("-22") == -22);
}