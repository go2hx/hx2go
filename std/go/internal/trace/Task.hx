package go.internal.trace;

@:structInit
@:go.Type({ name: "Task", instanceName: "trace.Task", imports: ["internal/trace"] })
extern class Task {

    @:native("ID") var ID: go.internal.trace.TaskID;
    @:native("Parent") var parent: go.internal.trace.TaskID;
    @:native("Type") var type: String;

function new(ID: go.internal.trace.TaskID, parent: go.internal.trace.TaskID, type: String);

}