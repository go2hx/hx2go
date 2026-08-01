package go.net.http;

@:structInit
@:go.Type({ name: "transportReadFromServerError", instanceName: "http.transportReadFromServerError", imports: ["net/http"] })
extern class TransportReadFromServerError {

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}