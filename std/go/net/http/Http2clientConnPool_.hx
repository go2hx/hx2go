package go.net.http;

@:structInit
@:go.Type({ name: "http2clientConnPool", instanceName: "http.http2clientConnPool", imports: ["net/http"] })
extern class Http2clientConnPool_ {

    @:native("GetClientConn") function getClientConn(req: go.Pointer<go.net.http.Request>, addr: String): (go.Result<go.Pointer<go.net.http.Http2ClientConn>>);
    @:native("MarkDead") function markDead(cc: go.Pointer<go.net.http.Http2ClientConn>): Void;

}