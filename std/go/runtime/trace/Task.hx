package go.runtime.trace;

@:structInit
@:go.Type({ name: "Task", instanceName: "trace.Task", imports: ["runtime/trace"] })
extern class Task {

    @:native("End") function end(): Void;

}