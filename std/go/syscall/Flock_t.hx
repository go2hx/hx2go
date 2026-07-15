package go.syscall;

@:structInit
@:go.Type({ name: "Flock_t", instanceName: "syscall.Flock_t", imports: ["syscall"] })
extern class Flock_t {

    @:native("Type") var type: go.Int16;
    @:native("Whence") var whence: go.Int16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Start") var start: go.Int64;
    @:native("Len") var len: go.Int64;
    @:native("Pid") var pid: go.Int32;
    @:native("Pad_cgo_1") var pad_cgo_1: go.GoArray<go.Byte, 4>;

function new(type: go.Int16, whence: go.Int16, pad_cgo_0: go.GoArray<go.Byte, 4>, start: go.Int64, len: go.Int64, pid: go.Int32, pad_cgo_1: go.GoArray<go.Byte, 4>);

}