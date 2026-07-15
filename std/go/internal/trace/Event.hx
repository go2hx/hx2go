package go.internal.trace;

@:structInit
@:go.Type({ name: "Event", instanceName: "trace.Event", imports: ["internal/trace"] })
extern class Event {

    @:native("Experimental") function experimental(): go.internal.trace.ExperimentalEvent;
    @:native("Goroutine") function goroutine(): go.internal.trace.GoID;
    @:native("Kind") function kind(): go.internal.trace.EventKind;
    @:native("Label") function label(): go.internal.trace.Label;
    @:native("Log") function log(): go.internal.trace.Log;
    @:native("Metric") function metric(): go.internal.trace.Metric;
    @:native("Proc") function proc(): go.internal.trace.ProcID;
    @:native("Range") function range(): go.internal.trace.Range;
    @:native("RangeAttributes") function rangeAttributes(): go.Slice<go.internal.trace.RangeAttribute>;
    @:native("Region") function region(): go.internal.trace.Region;
    @:native("Stack") function stack(): go.internal.trace.Stack;
    @:native("StateTransition") function stateTransition(): go.internal.trace.StateTransition;
    @:native("String") function string(): String;
    @:native("Sync") function sync(): go.internal.trace.Sync;
    @:native("Task") function task(): go.internal.trace.Task;
    @:native("Thread") function thread(): go.internal.trace.ThreadID;
    @:native("Time") function time(): go.internal.trace.Time;

}