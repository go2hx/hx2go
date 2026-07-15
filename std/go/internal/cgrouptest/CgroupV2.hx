package go.internal.cgrouptest;

@:structInit
@:go.Type({ name: "CgroupV2", instanceName: "cgrouptest.CgroupV2", imports: ["internal/cgrouptest"] })
extern class CgroupV2 {

    @:native("CPUMaxPath") function cPUMaxPath(): String;
    @:native("Path") function path(): String;
    @:native("SetCPUMax") function setCPUMax(quota: go.Int64, period: go.Int64): go.Error;

}