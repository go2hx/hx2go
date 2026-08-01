package go.net.http;

@:go.Type({ name: "newClientConner", instanceName: "http.newClientConner", imports: ["net/http"] })
extern typedef NewClientConner = {

    @:native("NewClientConn") function newClientConn(nc: go.net.Conn, internalStateHook: () -> Void): (go.Result<go.net.http.RoundTripper>);

}