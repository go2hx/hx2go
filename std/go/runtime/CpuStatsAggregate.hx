package go.runtime;

@:structInit
@:go.Type({ name: "cpuStatsAggregate", instanceName: "runtime.cpuStatsAggregate", imports: ["runtime"] })
extern class CpuStatsAggregate {

    @:native("GCAssistTime") var gCAssistTime: go.Int64;
    @:native("GCDedicatedTime") var gCDedicatedTime: go.Int64;
    @:native("GCIdleTime") var gCIdleTime: go.Int64;
    @:native("GCPauseTime") var gCPauseTime: go.Int64;
    @:native("GCTotalTime") var gCTotalTime: go.Int64;
    @:native("ScavengeAssistTime") var scavengeAssistTime: go.Int64;
    @:native("ScavengeBgTime") var scavengeBgTime: go.Int64;
    @:native("ScavengeTotalTime") var scavengeTotalTime: go.Int64;
    @:native("IdleTime") var idleTime: go.Int64;
    @:native("UserTime") var userTime: go.Int64;
    @:native("TotalTime") var totalTime: go.Int64;

}