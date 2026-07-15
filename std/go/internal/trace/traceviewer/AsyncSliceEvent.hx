package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "AsyncSliceEvent", instanceName: "traceviewer.AsyncSliceEvent", imports: ["internal/trace/traceviewer"] })
extern class AsyncSliceEvent {

    @:native("SliceEvent") var sliceEvent: go.internal.trace.traceviewer.SliceEvent;
    @:native("Category") var category: String;
    @:native("Scope") var scope: String;
    @:native("TaskColorIndex") var taskColorIndex: go.UInt64;

function new(sliceEvent: go.internal.trace.traceviewer.SliceEvent, category: String, scope: String, taskColorIndex: go.UInt64);

}