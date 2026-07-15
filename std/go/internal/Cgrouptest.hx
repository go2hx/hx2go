package go.internal;

@:go.Type({ name: "cgrouptest", instanceName: "cgrouptest.cgrouptest", imports: ["internal/cgrouptest"] })
extern class Cgrouptest {

    @:native("InCgroupV2") static function inCgroupV2(t: go.Pointer<go.testing.T>, fn: (p0: go.Pointer<go.internal.cgrouptest.CgroupV2>) -> Void): Void;

}