package go.internal.trace;

@:structInit
@:go.Type({ name: "EventConfig", instanceName: "trace.EventConfig", imports: ["internal/trace"] })
extern class EventConfig<T: go.internal.trace.EventDetails> {

    @:native("Time") var time: go.internal.trace.Time;
    @:native("Kind") var kind: go.internal.trace.EventKind;
    @:native("Goroutine") var goroutine: go.internal.trace.GoID;
    @:native("Proc") var proc: go.internal.trace.ProcID;
    @:native("Thread") var thread: go.internal.trace.ThreadID;
    @:native("Stack") var stack: go.internal.trace.Stack;
    @:native("Details") var details: T;

function new(time: go.internal.trace.Time, kind: go.internal.trace.EventKind, goroutine: go.internal.trace.GoID, proc: go.internal.trace.ProcID, thread: go.internal.trace.ThreadID, stack: go.internal.trace.Stack, details: T);

}