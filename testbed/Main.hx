import go.Syntax;
function main() {
    trace(new haxe.ds.Vector<Int>(10).get(4) == 0);
    trace(new haxe.ds.Vector<String>(10).get(7) == "");
    new haxe.ds.Vector<String>(10).set(5, "cool");
    var x = 0;
    var end = false;
    while (true) {
        switch Syntax.code("{0}", x) {
            case 0:
                break;
            case 1:
                trace(1);
        }
        end = true;
        break;
    }
    trace(end);
}