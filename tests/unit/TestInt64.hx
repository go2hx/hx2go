package unit;

function main() {
    trace((10 : haxe.Int64).toString() == "10");
    trace(haxe.Int64Helper.parseString("-22") == -22);
}