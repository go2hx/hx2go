package go.compress.flate;

/**
    A ReadError reports an error encountered while reading input.
    
    Deprecated: No longer returned.
**/
@:structInit
@:go.Type({ name: "ReadError", instanceName: "flate.ReadError", imports: ["compress/flate"] })
extern class ReadError {

    @:native("Offset") var offset: go.Int64;
    @:native("Err") var err: go.Error;

    function new(offset: go.Int64=0, err: go.Error=null);

    @:native("Error") function error(): (String);

}