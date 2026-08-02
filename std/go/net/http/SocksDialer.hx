package go.net.http;

@:structInit
@:go.Type({ name: "socksDialer", instanceName: "http.socksDialer", imports: ["net/http"] })
extern class SocksDialer {

    @:native("ProxyDial") var proxyDial: (p0: go.context.Context, p1: String, p2: String) -> (go.Result<go.net.Conn>);
    @:native("AuthMethods") var authMethods: go.Slice<go.net.http.SocksAuthMethod>;
    @:native("Authenticate") var authenticate: (p0: go.context.Context, p1: go.io.ReadWriter, p2: go.net.http.SocksAuthMethod) -> (go.Error);

    function new(proxyDial: (p0: go.context.Context, p1: String, p2: String) -> (go.Result<go.net.Conn>), authMethods: go.Slice<go.net.http.SocksAuthMethod>, authenticate: (p0: go.context.Context, p1: go.io.ReadWriter, p2: go.net.http.SocksAuthMethod) -> (go.Error));

    @:native("Dial") function dial(network: String, address: String): (go.Result<go.net.Conn>);
    @:native("DialContext") function dialContext(ctx: go.context.Context, network: String, address: String): (go.Result<go.net.Conn>);
    @:native("DialWithConn") function dialWithConn(ctx: go.context.Context, c: go.net.Conn, network: String, address: String): (go.Result<go.net.Addr>);

}