package go.internal.trace;

@:structInit
@:go.Type({ name: "UserTaskSummary", instanceName: "trace.UserTaskSummary", imports: ["internal/trace"] })
extern class UserTaskSummary {

    @:native("ID") var ID: go.internal.trace.TaskID;
    @:native("Name") var name: String;
    @:native("Parent") var parent: go.Pointer<go.internal.trace.UserTaskSummary>;
    @:native("Children") var children: go.Slice<go.Pointer<go.internal.trace.UserTaskSummary>>;
    @:native("Start") var start: go.Pointer<go.internal.trace.Event>;
    @:native("End") var end: go.Pointer<go.internal.trace.Event>;
    @:native("Logs") var logs: go.Slice<go.Pointer<go.internal.trace.Event>>;
    @:native("Regions") var regions: go.Slice<go.Pointer<go.internal.trace.UserRegionSummary>>;
    @:native("Goroutines") var goroutines: go.Map<go.internal.trace.GoID, go.Pointer<go.internal.trace.GoroutineSummary>>;

function new(ID: go.internal.trace.TaskID, name: String, parent: go.Pointer<go.internal.trace.UserTaskSummary>, children: go.Slice<go.Pointer<go.internal.trace.UserTaskSummary>>, start: go.Pointer<go.internal.trace.Event>, end: go.Pointer<go.internal.trace.Event>, logs: go.Slice<go.Pointer<go.internal.trace.Event>>, regions: go.Slice<go.Pointer<go.internal.trace.UserRegionSummary>>, goroutines: go.Map<go.internal.trace.GoID, go.Pointer<go.internal.trace.GoroutineSummary>>);

    @:native("Complete") function complete(): Bool;
    @:native("Descendents") function descendents(): go.Slice<go.Pointer<go.internal.trace.UserTaskSummary>>;

}