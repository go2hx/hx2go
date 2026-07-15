package go.net.http.internal.httpcommon;

@:structInit
@:go.Type({ name: "EncodeHeadersResult", instanceName: "httpcommon.EncodeHeadersResult", imports: ["net/http/internal/httpcommon"] })
extern class EncodeHeadersResult {

    @:native("HasBody") var hasBody: Bool;
    @:native("HasTrailers") var hasTrailers: Bool;

function new(hasBody: Bool, hasTrailers: Bool);

}