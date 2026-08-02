package go.net.http;

@:structInit
@:go.Type({ name: "unsupportedTEError", instanceName: "http.unsupportedTEError", imports: ["net/http"] })
extern class UnsupportedTEError {

    @:native("Error") function error(): (String);

}