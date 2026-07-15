package go.internal.trace;

@:structInit
@:go.Type({ name: "GoroutineExecStats", instanceName: "trace.GoroutineExecStats", imports: ["internal/trace"] })
extern class GoroutineExecStats {

    @:native("ExecTime") var execTime: go.time.Duration;
    @:native("SchedWaitTime") var schedWaitTime: go.time.Duration;
    @:native("BlockTimeByReason") var blockTimeByReason: go.Map<String, go.time.Duration>;
    @:native("SyscallTime") var syscallTime: go.time.Duration;
    @:native("SyscallBlockTime") var syscallBlockTime: go.time.Duration;
    @:native("TotalTime") var totalTime: go.time.Duration;
    @:native("RangeTime") var rangeTime: go.Map<String, go.time.Duration>;

function new(execTime: go.time.Duration, schedWaitTime: go.time.Duration, blockTimeByReason: go.Map<String, go.time.Duration>, syscallTime: go.time.Duration, syscallBlockTime: go.time.Duration, totalTime: go.time.Duration, rangeTime: go.Map<String, go.time.Duration>);

    @:native("NonOverlappingStats") function nonOverlappingStats(): go.Map<String, go.time.Duration>;
    @:native("UnknownTime") function unknownTime(): go.time.Duration;

}