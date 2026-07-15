package go.net.http;

@:structInit
@:go.Type({ name: "MaxBytesError", instanceName: "http.MaxBytesError", imports: ["net/http"] })
extern class MaxBytesError {

    @:native("Limit") var limit: go.Int64;

function new(limit: go.Int64);

    @:native("Error") function error(): String;

}