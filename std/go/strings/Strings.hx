package go.strings;

@:go.Type({ name: "strings", imports: ["strings"] })
extern class Strings {
    static function toUpper(s: String): String;
    static function toLower(s:String):String;
    static function index(s:String, substr:String):Int;
    static function lastIndex(s:String, substr:String):Int;
    static function split(s:String, sep:String):Slice<String>;
}