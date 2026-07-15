package go.internal.trace;

@:structInit
@:go.Type({ name: "Summary", instanceName: "trace.Summary", imports: ["internal/trace"] })
extern class Summary {

    @:native("Goroutines") var goroutines: go.Map<go.internal.trace.GoID, go.Pointer<go.internal.trace.GoroutineSummary>>;
    @:native("Tasks") var tasks: go.Map<go.internal.trace.TaskID, go.Pointer<go.internal.trace.UserTaskSummary>>;

function new(goroutines: go.Map<go.internal.trace.GoID, go.Pointer<go.internal.trace.GoroutineSummary>>, tasks: go.Map<go.internal.trace.TaskID, go.Pointer<go.internal.trace.UserTaskSummary>>);

}