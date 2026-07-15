package go.vendor.golang.org.x.net.http;

@:go.Type({ name: "httpguts", instanceName: "httpguts.httpguts", imports: ["vendor/golang.org/x/net/http/httpguts"] })
extern class Httpguts {

    @:native("HeaderValuesContainsToken") static function headerValuesContainsToken(values: go.Slice<String>, token: String): Bool;
    @:native("IsTokenRune") static function isTokenRune(r: go.Rune): Bool;
    @:native("PunycodeHostPort") static function punycodeHostPort(v: String): go.Result<String>;
    @:native("ValidHeaderFieldName") static function validHeaderFieldName(v: String): Bool;
    @:native("ValidHeaderFieldValue") static function validHeaderFieldValue(v: String): Bool;
    @:native("ValidHostHeader") static function validHostHeader(h: String): Bool;
    @:native("ValidTrailerHeader") static function validTrailerHeader(name: String): Bool;

}