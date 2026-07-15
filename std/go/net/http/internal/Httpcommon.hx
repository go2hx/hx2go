package go.net.http.internal;

@:go.Type({ name: "httpcommon", instanceName: "httpcommon.httpcommon", imports: ["net/http/internal/httpcommon"] })
extern class Httpcommon {

    @:go.Tuple("p0", "p1") @:native("CachedCanonicalHeader") static function cachedCanonicalHeader(v: String): go.Tuple<{ p0: String, p1: Bool }>;
    @:native("CanonicalHeader") static function canonicalHeader(v: String): String;
    @:native("EncodeHeaders") static function encodeHeaders(ctx: go.context.Context, param: go.net.http.internal.httpcommon.EncodeHeadersParam, headerf: (name: String, value: String) -> Void): go.Result<go.net.http.internal.httpcommon.EncodeHeadersResult>;
    @:native("IsRequestGzip") static function isRequestGzip(method: String, header: go.Map<String, go.Slice<String>>, disableCompression: Bool): Bool;
    @:go.Tuple("lower", "ascii") @:native("LowerHeader") static function lowerHeader(v: String): go.Tuple<{ lower: String, ascii: Bool }>;
    @:native("NewServerRequest") static function newServerRequest(rp: go.net.http.internal.httpcommon.ServerRequestParam): go.net.http.internal.httpcommon.ServerRequestResult;

}