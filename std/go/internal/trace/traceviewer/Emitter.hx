package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "Emitter", instanceName: "traceviewer.Emitter", imports: ["internal/trace/traceviewer"] })
extern class Emitter {

    @:native("Arrow") function arrow(a: go.internal.trace.traceviewer.ArrowEvent): Void;
    @:native("AsyncSlice") function asyncSlice(s: go.internal.trace.traceviewer.AsyncSliceEvent): Void;
    @:native("Err") function err(): go.Error;
    @:native("Event") function event(ev: go.Pointer<go.internal.trace.traceviewer.format.Event>): Void;
    @:native("Flush") function flush(): Void;
    @:native("Focus") function focus(id: go.UInt64): Void;
    @:native("Gomaxprocs") function gomaxprocs(v: go.UInt64): Void;
    @:native("GoroutineTransition") function goroutineTransition(ts: go.time.Duration, _from: go.internal.trace.traceviewer.GState, _to: go.internal.trace.traceviewer.GState): Void;
    @:native("HeapAlloc") function heapAlloc(ts: go.time.Duration, v: go.UInt64): Void;
    @:native("HeapGoal") function heapGoal(ts: go.time.Duration, v: go.UInt64): Void;
    @:native("IncThreadStateCount") function incThreadStateCount(ts: go.time.Duration, state: go.internal.trace.traceviewer.ThreadState, delta: go.Int64): Void;
    @:native("Instant") function instant(i: go.internal.trace.traceviewer.InstantEvent): Void;
    @:native("OptionalEvent") function optionalEvent(ev: go.Pointer<go.internal.trace.traceviewer.format.Event>): Void;
    @:native("Resource") function resource(id: go.UInt64, name: String): Void;
    @:native("SetResourceFilter") function setResourceFilter(filter: (p0: go.UInt64) -> Bool): Void;
    @:native("SetResourceType") function setResourceType(name: String): Void;
    @:native("Slice") function slice(s: go.internal.trace.traceviewer.SliceEvent): Void;
    @:native("Stack") function stack(stk: go.Slice<go.internal.trace.StackFrame>): go.GoInt;
    @:native("Task") function task(id: go.UInt64, name: String, sortIndex: go.GoInt): Void;
    @:native("TaskArrow") function taskArrow(a: go.internal.trace.traceviewer.ArrowEvent): Void;
    @:native("TaskSlice") function taskSlice(s: go.internal.trace.traceviewer.SliceEvent): Void;

}