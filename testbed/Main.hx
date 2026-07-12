import haxe.ds.StringMap;

function main() {
    var x = new StringMap<Int>(); // ["ten" => 10];
    x.set("ten", 10);
    trace(x.get("ten"));
}