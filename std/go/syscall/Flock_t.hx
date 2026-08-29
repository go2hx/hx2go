package go.syscall;

@:structInit
@:go.Type({ name: "Flock_t", instanceName: "syscall.Flock_t", imports: ["syscall"] })
extern class Flock_t {

    @:native("Start") var start: go.Int64;
    @:native("Len") var len: go.Int64;
    @:native("Pid") var pid: go.Int32;
    @:native("Type") var type: go.Int16;
    @:native("Whence") var whence: go.Int16;

    function new(start: go.Int64=0, len: go.Int64=0, pid: go.Int32=0, type: go.Int16=0, whence: go.Int16=0);

}