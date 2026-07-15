package go.net.http;

@:structInit
@:go.Type({ name: "PushOptions", instanceName: "http.PushOptions", imports: ["net/http"] })
extern class PushOptions {

    @:native("Method") var method: String;
    @:native("Header") var header: go.net.http.Header;

function new(method: String, header: go.net.http.Header);

}