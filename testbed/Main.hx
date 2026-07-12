import haxe.ds.StringMap;

function main() {
    var m = new StringMap<Int>();
    m.set("ten", 10);
    trace(m.get("ten"));
}