package go.vendor.golang.org.x.net.http.httpproxy;

@:structInit
@:go.Type({ name: "Config", instanceName: "httpproxy.Config", imports: ["vendor/golang.org/x/net/http/httpproxy"] })
extern class Config {

    @:native("HTTPProxy") var hTTPProxy: String;
    @:native("HTTPSProxy") var hTTPSProxy: String;
    @:native("NoProxy") var noProxy: String;
    @:native("CGI") var CGI: Bool;

function new(hTTPProxy: String, hTTPSProxy: String, noProxy: String, CGI: Bool);

    @:native("ProxyFunc") function proxyFunc(): (reqURL: go.Pointer<go.net.url.URL>) -> go.Result<go.Pointer<go.net.url.URL>>;

}