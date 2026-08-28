package go.net.http;

/**
    MaxBytesError is returned by [MaxBytesReader] when its read limit is exceeded.
**/
@:structInit
@:go.Type({ name: "MaxBytesError", instanceName: "http.MaxBytesError", imports: ["net/http"] })
extern class MaxBytesError {

    @:native("Limit") var limit: go.Int64;

    function new(limit: go.Int64=0);

    @:native("Error") function error(): (String);

}