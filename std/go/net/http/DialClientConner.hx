package go.net.http;

@:go.Type({ name: "dialClientConner", instanceName: "http.dialClientConner", imports: ["net/http"] })
extern typedef DialClientConner = {

    @:native("DialClientConn") function dialClientConn(ctx: go.context.Context, address: String, proxy: go.Pointer<go.net.url.URL>, internalStateHook: () -> Void): (go.Result<go.net.http.RoundTripper>);

}