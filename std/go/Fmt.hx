package go;

@:go.TypeAccess({ name: "fmt", imports: ["fmt"] })
extern class Fmt {
	public static function println(e: haxe.Rest<Dynamic>): Void;
    public static function print(e: haxe.Rest<Dynamic>): Void;
}
