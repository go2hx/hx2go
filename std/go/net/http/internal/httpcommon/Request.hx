package go.net.http.internal.httpcommon;

@:structInit
@:go.Type({ name: "Request", instanceName: "httpcommon.Request", imports: ["net/http/internal/httpcommon"] })
extern class Request {

    @:native("URL") var URL: go.Pointer<go.net.url.URL>;
    @:native("Method") var method: String;
    @:native("Host") var host: String;
    @:native("Header") var header: go.Map<String, go.Slice<String>>;
    @:native("Trailer") var trailer: go.Map<String, go.Slice<String>>;
    @:native("ActualContentLength") var actualContentLength: go.Int64;

function new(URL: go.Pointer<go.net.url.URL>, method: String, host: String, header: go.Map<String, go.Slice<String>>, trailer: go.Map<String, go.Slice<String>>, actualContentLength: go.Int64);

}