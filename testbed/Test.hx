import go.Go;
@:analyzer(ignore)
class Test {

    public static function main() {
        var t = {i: 12, f: 12.1}; // this & lines below required to stop Haxe optimising away the test!
        Sys.println(t);
        var i:go.GoInt = go.Syntax.code("{0}.(int)", t.i);
        var f:Float = go.Syntax.code("{0}.(float64)", t.f);
        Sys.println(i == f);
    }

}
