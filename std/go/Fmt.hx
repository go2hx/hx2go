package go;

@:go.TypeAccess({name: "fmt", imports: ["fmt"]})
extern class Fmt {
	static function println(e:haxe.Rest<Dynamic>):Void;
	static function print(e:haxe.Rest<Dynamic>):Void;
	static function sprintf(format:String, args:haxe.Rest<Dynamic>):String;
}
