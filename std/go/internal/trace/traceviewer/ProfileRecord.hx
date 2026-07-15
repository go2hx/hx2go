package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "ProfileRecord", instanceName: "traceviewer.ProfileRecord", imports: ["internal/trace/traceviewer"] })
extern class ProfileRecord {

    @:native("Stack") var stack: go.Slice<go.internal.trace.StackFrame>;
    @:native("Count") var count: go.UInt64;
    @:native("Time") var time: go.time.Duration;

function new(stack: go.Slice<go.internal.trace.StackFrame>, count: go.UInt64, time: go.time.Duration);

}