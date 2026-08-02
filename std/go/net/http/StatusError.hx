package go.net.http;

@:structInit
@:go.Type({ name: "statusError", instanceName: "http.statusError", imports: ["net/http"] })
extern class StatusError {

    @:native("Error") function error(): (String);

}