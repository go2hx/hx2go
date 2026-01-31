import go.Go;
@:analyzer(ignore)
class Test {

    public static function main() {
        var a: go.Int32 = -16;
        var b: go.Int32 = 3;
        Sys.println(a >>> b); // 536870910
        Sys.println(a >> b);  // -2

        var x: go.UInt32 = 16;
        var y: go.UInt32 = 3;
        Sys.println(x >>> y); // 2
        Sys.println(x >> y);  // 2

        Sys.println(a >> x);  // -1
        Sys.println(a >>> x); // 65535
        Sys.println(a >> y);  // -2
        Sys.println(a >>> y); // 536870910
        Sys.println(b >> x);  // 0
        Sys.println(b >>> x); // 0
        Sys.println(b >> y);  // 0
        Sys.println(b >>> y); // 0
        Sys.println(x >> a);  // 0
        Sys.println(x >>> a); // 0
        Sys.println(x >> b);  // 2
        Sys.println(x >>> b); // 2
        Sys.println(y >> a);  // 0
        Sys.println(y >>> a); // 0
        Sys.println(y >> b);  // 0
        Sys.println(y >>> b); // 0

        Sys.println(5 >> Go.int(3));
        Sys.println(5 >>> Go.int(3));
    }

}
