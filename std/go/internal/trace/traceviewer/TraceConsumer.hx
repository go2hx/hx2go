package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "TraceConsumer", instanceName: "traceviewer.TraceConsumer", imports: ["internal/trace/traceviewer"] })
extern class TraceConsumer {

    @:native("ConsumeTimeUnit") var consumeTimeUnit: (unit: String) -> Void;
    @:native("ConsumeViewerEvent") var consumeViewerEvent: (v: go.Pointer<go.internal.trace.traceviewer.format.Event>, required: Bool) -> Void;
    @:native("ConsumeViewerFrame") var consumeViewerFrame: (key: String, f: go.internal.trace.traceviewer.format.Frame) -> Void;
    @:native("Flush") var flush: () -> Void;

function new(consumeTimeUnit: (unit: String) -> Void, consumeViewerEvent: (v: go.Pointer<go.internal.trace.traceviewer.format.Event>, required: Bool) -> Void, consumeViewerFrame: (key: String, f: go.internal.trace.traceviewer.format.Frame) -> Void, flush: () -> Void);

}