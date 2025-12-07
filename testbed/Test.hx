// NOTE: @:native causes the name to change in the dump file
// We only want to use the metadata to point to the Go reference api
@:go.package("fmt")
@:go.native("fmt")
extern class Fmt {
    @:go.native("Println")
	public static function println(e:haxe.Rest<Dynamic>):Void;
}

// transformer -> goImports: ['fmt'] addModule(name: String): Void;
// translation -> goImports Fmt.println(...) -> fmt.Println(...)
// import "fmt"
// 
// func main() {
//    fmt.Println("Hello");
// }

// Types
// cache = []
//
// go.Fmt
@:dce(ignore)
@:analyzer(ignore)
class Test {
    public static function main() {
        var x = 10, y = 12;
        x = 15;
        x++;

        while (x == 2) {
            Fmt.println("A");
        }

        if( x == 16 ) {
            Fmt.println("hello", 20 + x);
        }else if (x == 20) {
            Fmt.println("hello", 20 + x);
        }else if (x == 10) {
            Fmt.println("kkk");
        }
    }
}