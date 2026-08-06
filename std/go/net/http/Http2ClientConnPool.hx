package go.net.http;

@:go.Type({ name: "http2ClientConnPool", instanceName: "http.http2ClientConnPool", imports: ["net/http"] })
extern typedef Http2ClientConnPool = {

    @:native("GetClientConn") function getClientConn(req: go.Pointer<go.net.http.Request>, addr: String): (go.Result<go.Pointer<go.net.http.Http2ClientConn>>);
    @:native("MarkDead") function markDead(p0: go.Pointer<go.net.http.Http2ClientConn>): Void;

}