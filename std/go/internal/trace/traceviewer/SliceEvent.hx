package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "SliceEvent", instanceName: "traceviewer.SliceEvent", imports: ["internal/trace/traceviewer"] })
extern class SliceEvent {

    @:native("Name") var name: String;
    @:native("Ts") var ts: go.time.Duration;
    @:native("Dur") var dur: go.time.Duration;
    @:native("Resource") var resource: go.UInt64;
    @:native("Stack") var stack: go.GoInt;
    @:native("EndStack") var endStack: go.GoInt;
    @:native("Arg") var arg: Dynamic;

function new(name: String, ts: go.time.Duration, dur: go.time.Duration, resource: go.UInt64, stack: go.GoInt, endStack: go.GoInt, arg: Dynamic);

}