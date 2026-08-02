package go.net.http;

@:structInit
@:go.Type({ name: "requestBodyReadError", instanceName: "http.requestBodyReadError", imports: ["net/http"] })
extern class RequestBodyReadError {

    @:native("Error") function error(): (String);

}