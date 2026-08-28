package go.runtime.trace;

/**
    Task is a data type for tracing a user-defined, logical operation.
**/
@:structInit
@:go.Type({ name: "Task", instanceName: "trace.Task", imports: ["runtime/trace"] })
extern class Task {

    /**
        End marks the end of the operation represented by the [Task].
    **/
    @:native("End") function end(): Void;

}