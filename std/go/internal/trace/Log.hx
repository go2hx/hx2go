package go.internal.trace;

@:structInit
@:go.Type({ name: "Log", instanceName: "trace.Log", imports: ["internal/trace"] })
extern class Log {

    @:native("Task") var task: go.internal.trace.TaskID;
    @:native("Category") var category: String;
    @:native("Message") var message: String;

function new(task: go.internal.trace.TaskID, category: String, message: String);

}