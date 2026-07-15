package go.net.http.internal.httpcommon;

@:structInit
@:go.Type({ name: "ServerRequestParam", instanceName: "httpcommon.ServerRequestParam", imports: ["net/http/internal/httpcommon"] })
extern class ServerRequestParam {

    @:native("Method") var method: String;
    @:native("Scheme") var scheme: String;
    @:native("Authority") var authority: String;
    @:native("Path") var path: String;
    @:native("Protocol") var protocol: String;
    @:native("Header") var header: go.Map<String, go.Slice<String>>;

function new(method: String, scheme: String, authority: String, path: String, protocol: String, header: go.Map<String, go.Slice<String>>);

}