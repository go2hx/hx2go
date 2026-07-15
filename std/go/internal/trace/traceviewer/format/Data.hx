package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "Data", instanceName: "format.Data", imports: ["internal/trace/traceviewer/format"] })
extern class Data {

    @:native("Events") var events: go.Slice<go.Pointer<go.internal.trace.traceviewer.format.Event>>;
    @:native("Frames") var frames: go.Map<String, go.internal.trace.traceviewer.format.Frame>;
    @:native("TimeUnit") var timeUnit: String;

function new(events: go.Slice<go.Pointer<go.internal.trace.traceviewer.format.Event>>, frames: go.Map<String, go.internal.trace.traceviewer.format.Frame>, timeUnit: String);

}