package go.compress.flate;

/**
    A WriteError reports an error encountered while writing output.
    
    Deprecated: No longer returned.
**/
@:structInit
@:go.Type({ name: "WriteError", instanceName: "flate.WriteError", imports: ["compress/flate"] })
extern class WriteError {

    @:native("Offset") var offset: go.Int64;
    @:native("Err") var err: go.Error;

    function new(offset: go.Int64=0, err: go.Error=null);

    @:native("Error") function error(): (String);

}