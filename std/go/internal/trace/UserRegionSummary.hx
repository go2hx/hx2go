package go.internal.trace;

@:structInit
@:go.Type({ name: "UserRegionSummary", instanceName: "trace.UserRegionSummary", imports: ["internal/trace"] })
extern class UserRegionSummary {

    @:native("TaskID") var taskID: go.internal.trace.TaskID;
    @:native("Name") var name: String;
    @:native("Start") var start: go.Pointer<go.internal.trace.Event>;
    @:native("End") var end: go.Pointer<go.internal.trace.Event>;
    @:native("GoroutineExecStats") var goroutineExecStats: go.internal.trace.GoroutineExecStats;

function new(taskID: go.internal.trace.TaskID, name: String, start: go.Pointer<go.internal.trace.Event>, end: go.Pointer<go.internal.trace.Event>, goroutineExecStats: go.internal.trace.GoroutineExecStats);

    @:native("NonOverlappingStats") function nonOverlappingStats(): go.Map<String, go.time.Duration>;
    @:native("UnknownTime") function unknownTime(): go.time.Duration;

}