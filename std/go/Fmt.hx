package go;

@:go.package("fmt")
@:go.native("fmt")
extern class Fmt {

    @:go.native("Println")
	public static function println(e: haxe.Rest<Dynamic>): Void;

    @:go.native("Print")
    public static function print(e: haxe.Rest<Dynamic>): Void;

}
