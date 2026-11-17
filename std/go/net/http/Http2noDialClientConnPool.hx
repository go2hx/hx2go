package go.net.http;

@:structInit
@:go.Type({ name: "http2noDialClientConnPool", instanceName: "http.http2noDialClientConnPool", imports: ["net/http"] })
extern class Http2noDialClientConnPool {

    @:native("GetClientConn") function getClientConn(req: go.Pointer<go.net.http.Request>, addr: String): (go.Result<go.Pointer<go.net.http.Http2ClientConn>>);
    @:native("MarkDead") function markDead(cc: go.Pointer<go.net.http.Http2ClientConn>): Void;

}