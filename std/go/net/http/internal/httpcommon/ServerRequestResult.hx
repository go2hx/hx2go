package go.net.http.internal.httpcommon;

@:structInit
@:go.Type({ name: "ServerRequestResult", instanceName: "httpcommon.ServerRequestResult", imports: ["net/http/internal/httpcommon"] })
extern class ServerRequestResult {

    @:native("URL") var URL: go.Pointer<go.net.url.URL>;
    @:native("RequestURI") var requestURI: String;
    @:native("Trailer") var trailer: go.Map<String, go.Slice<String>>;
    @:native("NeedsContinue") var needsContinue: Bool;
    @:native("InvalidReason") var invalidReason: String;

function new(URL: go.Pointer<go.net.url.URL>, requestURI: String, trailer: go.Map<String, go.Slice<String>>, needsContinue: Bool, invalidReason: String);

}