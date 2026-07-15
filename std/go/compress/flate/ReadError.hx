package go.compress.flate;

@:structInit
@:go.Type({ name: "ReadError", instanceName: "flate.ReadError", imports: ["compress/flate"] })
extern class ReadError {

    @:native("Offset") var offset: go.Int64;
    @:native("Err") var err: go.Error;

function new(offset: go.Int64, err: go.Error);

    @:native("Error") function error(): String;

}