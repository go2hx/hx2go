package go.net.http.httputil;

@:structInit
@:go.Type({ name: "ProxyRequest", instanceName: "httputil.ProxyRequest", imports: ["net/http/httputil"] })
extern class ProxyRequest {

    @:native("In") var _in: go.Pointer<go.net.http.Request>;
    @:native("Out") var out: go.Pointer<go.net.http.Request>;

    function new(_in: go.Pointer<go.net.http.Request>=null, out: go.Pointer<go.net.http.Request>=null);

    @:native("SetURL") function setURL(target: go.Pointer<go.net.url.URL>): Void;
    @:native("SetXForwarded") function setXForwarded(): Void;

}