package go.internal.runtime;

@:go.Type({ name: "cgroup", instanceName: "cgroup.cgroup", imports: ["internal/runtime/cgroup"] })
extern class Cgroup {

    @:native("ParseSize") static var ParseSize: go.GoInt;
    @:native("PathSize") static var PathSize: go.GoInt;
    @:native("ScratchSize") static var ScratchSize: go.GoInt;
    @:native("V1") static var V1: go.internal.runtime.cgroup.Version;
    @:native("V2") static var V2: go.internal.runtime.cgroup.Version;
    @:native("VersionUnknown") static var VersionUnknown: go.internal.runtime.cgroup.Version;

    @:go.Tuple("p0", "p1", "p2") @:native("FindCPU") static function findCPU(out: go.Slice<go.Byte>, scratch: go.Slice<go.Byte>): go.Tuple<{ p0: go.GoInt, p1: go.internal.runtime.cgroup.Version, p2: go.Error }>;
    @:go.Tuple("p0", "p1", "p2") @:native("FindCPUCgroup") static function findCPUCgroup(out: go.Slice<go.Byte>, scratch: go.Slice<go.Byte>): go.Tuple<{ p0: go.GoInt, p1: go.internal.runtime.cgroup.Version, p2: go.Error }>;
    @:native("FindCPUMountPoint") static function findCPUMountPoint(out: go.Slice<go.Byte>, cgroup: go.Slice<go.Byte>, version: go.internal.runtime.cgroup.Version, scratch: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("OpenCPU") static function openCPU(scratch: go.Slice<go.Byte>): go.Result<go.internal.runtime.cgroup.CPU>;
    @:go.Tuple("p0", "p1", "p2") @:native("ReadCPULimit") static function readCPULimit(c: go.internal.runtime.cgroup.CPU): go.Tuple<{ p0: Float, p1: Bool, p2: go.Error }>;

}