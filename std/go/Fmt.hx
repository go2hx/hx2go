package go;

@:go.StaticAccess({ name: "fmt", imports: ["fmt"], transformName: true })
extern class Fmt {
	public static function println(e: haxe.Rest<Dynamic>): Void;
    public static function print(e: haxe.Rest<Dynamic>): Void;
}
