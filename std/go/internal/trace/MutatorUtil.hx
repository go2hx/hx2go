package go.internal.trace;

@:structInit
@:go.Type({ name: "MutatorUtil", instanceName: "trace.MutatorUtil", imports: ["internal/trace"] })
extern class MutatorUtil {

    @:native("Time") var time: go.Int64;
    @:native("Util") var util: Float;

function new(time: go.Int64, util: Float);

}