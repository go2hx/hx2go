package go.internal.syscall.unix;

@:structInit
@:go.Type({ name: "SiginfoChild", instanceName: "unix.SiginfoChild", imports: ["internal/syscall/unix"] })
extern class SiginfoChild {

    @:native("Signo") var signo: go.Int32;
    @:native("Pid") var pid: go.Int32;
    @:native("Uid") var uid: go.UInt32;
    @:native("Status") var status: go.Int32;

function new(signo: go.Int32, pid: go.Int32, uid: go.UInt32, status: go.Int32);

    @:native("WaitStatus") function waitStatus(): go.syscall.WaitStatus;

}