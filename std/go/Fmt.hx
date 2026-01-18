package go;

@:go.StaticAccess({ name: "fmt", imports: ["fmt"] })
extern class Fmt {

    @:native("Println")
	public static function println(e: haxe.Rest<Dynamic>): Void;

    @:native("Print")
    public static function print(e: haxe.Rest<Dynamic>): Void;

}
