package go.net.http.internal;

@:go.Type({ name: "ascii", instanceName: "ascii.ascii", imports: ["net/http/internal/ascii"] })
extern class Ascii {

    @:native("EqualFold") static function equalFold(s: String, t: String): Bool;
    @:native("Is") static function _is(s: String): Bool;
    @:native("IsPrint") static function isPrint(s: String): Bool;
    @:go.Tuple("lower", "ok") @:native("ToLower") static function toLower(s: String): go.Tuple<{ lower: String, ok: Bool }>;

}