package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "Range", instanceName: "traceviewer.Range", imports: ["internal/trace/traceviewer"] })
extern class Range {

    @:native("Name") var name: String;
    @:native("Start") var start: go.GoInt;
    @:native("End") var end: go.GoInt;
    @:native("StartTime") var startTime: go.Int64;
    @:native("EndTime") var endTime: go.Int64;

function new(name: String, start: go.GoInt, end: go.GoInt, startTime: go.Int64, endTime: go.Int64);

    @:native("URL") function URL(viewType: go.internal.trace.traceviewer.ViewType): String;

}