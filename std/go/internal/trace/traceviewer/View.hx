package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "View", instanceName: "traceviewer.View", imports: ["internal/trace/traceviewer"] })
extern class View {

    @:native("Type") var type: go.internal.trace.traceviewer.ViewType;
    @:native("Ranges") var ranges: go.Slice<go.internal.trace.traceviewer.Range>;

function new(type: go.internal.trace.traceviewer.ViewType, ranges: go.Slice<go.internal.trace.traceviewer.Range>);

    @:native("URL") function URL(rangeIdx: go.GoInt): String;

}