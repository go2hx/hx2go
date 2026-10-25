package go.net.http;

@:go.Type({ name: "http2ExternalServerConfig", instanceName: "http.http2ExternalServerConfig", imports: ["net/http"] })
extern typedef Http2ExternalServerConfig = {

    @:native("HTTP2Config") function hTTP2Config(): (go.net.http.HTTP2Config);
    @:native("IdleTimeout") function idleTimeout(): (go.time.Duration);
    @:native("ServeConnFunc") function serveConnFunc(p0: (ctx: go.context.Context, nc: go.net.Conn, h: go.net.http.Handler, sawClientPreface: Bool, upgradeReq: go.Pointer<go.net.http.Request>, settings: go.Slice<go.Byte>) -> Void): Void;

}