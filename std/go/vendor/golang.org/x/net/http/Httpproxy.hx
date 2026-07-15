package go.vendor.golang.org.x.net.http;

@:go.Type({ name: "httpproxy", instanceName: "httpproxy.httpproxy", imports: ["vendor/golang.org/x/net/http/httpproxy"] })
extern class Httpproxy {

    @:native("FromEnvironment") static function fromEnvironment(): go.Pointer<go.vendor.golang.org.x.net.http.httpproxy.Config>;

}