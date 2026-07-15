package go.internal;

@:go.Type({ name: "stringslite", instanceName: "stringslite.stringslite", imports: ["internal/stringslite"] })
extern class Stringslite {

    @:native("Clone") static function clone(s: String): String;
    @:go.Tuple("before", "after", "found") @:native("Cut") static function cut(s: String, sep: String): go.Tuple<{ before: String, after: String, found: Bool }>;
    @:go.Tuple("after", "found") @:native("CutPrefix") static function cutPrefix(s: String, prefix: String): go.Tuple<{ after: String, found: Bool }>;
    @:go.Tuple("before", "found") @:native("CutSuffix") static function cutSuffix(s: String, suffix: String): go.Tuple<{ before: String, found: Bool }>;
    @:native("HasPrefix") static function hasPrefix(s: String, prefix: String): Bool;
    @:native("HasSuffix") static function hasSuffix(s: String, suffix: String): Bool;
    @:native("Index") static function index(s: String, substr: String): go.GoInt;
    @:native("IndexByte") static function indexByte(s: String, c: go.Byte): go.GoInt;
    @:native("TrimPrefix") static function trimPrefix(s: String, prefix: String): String;
    @:native("TrimSuffix") static function trimSuffix(s: String, suffix: String): String;

}