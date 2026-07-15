package go.internal.trace;

@:structInit
@:go.Type({ name: "UtilWindow", instanceName: "trace.UtilWindow", imports: ["internal/trace"] })
extern class UtilWindow {

    @:native("Time") var time: go.Int64;
    @:native("MutatorUtil") var mutatorUtil: Float;

function new(time: go.Int64, mutatorUtil: Float);

}