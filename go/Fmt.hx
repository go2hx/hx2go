package go;

@:go.package("fmt")
@:go.native("fmt")
extern class Fmt {
    @:go.native("Println")
	public static extern function Println(e:haxe.Rest<Dynamic>):Void;
}
