package go.internal.trace;

@:structInit
@:go.Type({ name: "ExperimentalEvent", instanceName: "trace.ExperimentalEvent", imports: ["internal/trace"] })
extern class ExperimentalEvent {

    @:native("Name") var name: String;
    @:native("Experiment") var experiment: String;
    @:native("Args") var args: go.Slice<String>;

function new(name: String, experiment: String, args: go.Slice<String>);

    @:native("ArgValue") function argValue(i: go.GoInt): go.internal.trace.Value;

}