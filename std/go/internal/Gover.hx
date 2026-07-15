package go.internal;

@:go.Type({ name: "gover", instanceName: "gover.gover", imports: ["internal/gover"] })
extern class Gover {

    @:native("CmpInt") static function cmpInt(x: String, y: String): go.GoInt;
    @:native("Compare") static function compare(x: String, y: String): go.GoInt;
    @:native("DecInt") static function decInt(decimal: String): String;
    @:native("IsLang") static function isLang(x: String): Bool;
    @:native("IsValid") static function isValid(x: String): Bool;
    @:native("Lang") static function lang(x: String): String;
    @:native("Max") static function max(x: String, y: String): String;
    @:native("Parse") static function parse(x: String): go.internal.gover.Version;

}