package go.runtime;

@:structInit
@:go.Type({ name: "cpuStats", instanceName: "runtime.cpuStats", imports: ["runtime"] })
extern class CpuStats {

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

    function new(gCAssistTime: go.Int64, gCDedicatedTime: go.Int64, gCIdleTime: go.Int64, gCPauseTime: go.Int64, gCTotalTime: go.Int64, scavengeAssistTime: go.Int64, scavengeBgTime: go.Int64, scavengeTotalTime: go.Int64, idleTime: go.Int64, userTime: go.Int64, totalTime: go.Int64);

}