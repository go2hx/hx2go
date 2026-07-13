package unit;

function main() {
    assert(new haxe.ds.Vector<Int>(10).get(4) == 0);
    assert(new haxe.ds.Vector<String>(10).get(7) == "");
}