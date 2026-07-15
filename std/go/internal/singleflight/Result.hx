package go.internal.singleflight;

@:structInit
@:go.Type({ name: "Result", instanceName: "singleflight.Result", imports: ["internal/singleflight"] })
extern class Result {

    @:native("Val") var val: Dynamic;
    @:native("Err") var err: go.Error;
    @:native("Shared") var shared: Bool;

function new(val: Dynamic, err: go.Error, shared: Bool);

}