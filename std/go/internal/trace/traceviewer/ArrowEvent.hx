package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "ArrowEvent", instanceName: "traceviewer.ArrowEvent", imports: ["internal/trace/traceviewer"] })
extern class ArrowEvent {

    @:native("Name") var name: String;
    @:native("Start") var start: go.time.Duration;
    @:native("End") var end: go.time.Duration;
    @:native("FromResource") var fromResource: go.UInt64;
    @:native("FromStack") var fromStack: go.GoInt;
    @:native("ToResource") var toResource: go.UInt64;

function new(name: String, start: go.time.Duration, end: go.time.Duration, fromResource: go.UInt64, fromStack: go.GoInt, toResource: go.UInt64);

}