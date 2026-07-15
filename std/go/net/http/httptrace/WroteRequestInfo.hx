package go.net.http.httptrace;

@:structInit
@:go.Type({ name: "WroteRequestInfo", instanceName: "httptrace.WroteRequestInfo", imports: ["net/http/httptrace"] })
extern class WroteRequestInfo {

    @:native("Err") var err: go.Error;

function new(err: go.Error);

}