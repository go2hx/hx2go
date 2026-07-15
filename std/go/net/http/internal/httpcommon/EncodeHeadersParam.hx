package go.net.http.internal.httpcommon;

@:structInit
@:go.Type({ name: "EncodeHeadersParam", instanceName: "httpcommon.EncodeHeadersParam", imports: ["net/http/internal/httpcommon"] })
extern class EncodeHeadersParam {

    @:native("Request") var request: go.net.http.internal.httpcommon.Request;
    @:native("AddGzipHeader") var addGzipHeader: Bool;
    @:native("PeerMaxHeaderListSize") var peerMaxHeaderListSize: go.UInt64;
    @:native("DefaultUserAgent") var defaultUserAgent: String;

function new(request: go.net.http.internal.httpcommon.Request, addGzipHeader: Bool, peerMaxHeaderListSize: go.UInt64, defaultUserAgent: String);

}