package go.syscall;

@:structInit
@:go.Type({ name: "Ucred", instanceName: "syscall.Ucred", imports: ["syscall"] })
extern class Ucred {

    @:native("Pid") var pid: go.Int32;
    @:native("Uid") var uid: go.UInt32;
    @:native("Gid") var gid: go.UInt32;

function new(pid: go.Int32, uid: go.UInt32, gid: go.UInt32);

}