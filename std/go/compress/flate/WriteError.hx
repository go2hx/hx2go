package go.compress.flate;

@:structInit
@:go.Type({ name: "WriteError", instanceName: "flate.WriteError", imports: ["compress/flate"] })
extern class WriteError {

    @:native("Offset") var offset: go.Int64;
    @:native("Err") var err: go.Error;

function new(offset: go.Int64, err: go.Error);

    @:native("Error") function error(): String;

}