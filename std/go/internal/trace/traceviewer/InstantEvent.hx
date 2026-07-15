package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "InstantEvent", instanceName: "traceviewer.InstantEvent", imports: ["internal/trace/traceviewer"] })
extern class InstantEvent {

    @:native("Ts") var ts: go.time.Duration;
    @:native("Name") var name: String;
    @:native("Category") var category: String;
    @:native("Resource") var resource: go.UInt64;
    @:native("Stack") var stack: go.GoInt;
    @:native("Arg") var arg: Dynamic;

function new(ts: go.time.Duration, name: String, category: String, resource: go.UInt64, stack: go.GoInt, arg: Dynamic);

}