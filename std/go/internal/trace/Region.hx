package go.internal.trace;

@:structInit
@:go.Type({ name: "Region", instanceName: "trace.Region", imports: ["internal/trace"] })
extern class Region {

    @:native("Task") var task: go.internal.trace.TaskID;
    @:native("Type") var type: String;

function new(task: go.internal.trace.TaskID, type: String);

}