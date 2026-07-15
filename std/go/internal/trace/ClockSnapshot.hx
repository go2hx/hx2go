package go.internal.trace;

@:structInit
@:go.Type({ name: "ClockSnapshot", instanceName: "trace.ClockSnapshot", imports: ["internal/trace"] })
extern class ClockSnapshot {

    @:native("Trace") var trace: go.internal.trace.Time;
    @:native("Wall") var wall: go.time.Time;
    @:native("Mono") var mono: go.UInt64;

function new(trace: go.internal.trace.Time, wall: go.time.Time, mono: go.UInt64);

}