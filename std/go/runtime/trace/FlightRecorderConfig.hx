package go.runtime.trace;

@:structInit
@:go.Type({ name: "FlightRecorderConfig", instanceName: "trace.FlightRecorderConfig", imports: ["runtime/trace"] })
extern class FlightRecorderConfig {

    @:native("MinAge") var minAge: go.time.Duration;
    @:native("MaxBytes") var maxBytes: go.UInt64;

function new(minAge: go.time.Duration, maxBytes: go.UInt64);

}