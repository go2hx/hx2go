package go.syscall;

@:structInit
@:go.Type({ name: "SockaddrNetlink", instanceName: "syscall.SockaddrNetlink", imports: ["syscall"] })
extern class SockaddrNetlink {

    @:native("Family") var family: go.UInt16;
    @:native("Pad") var pad: go.UInt16;
    @:native("Pid") var pid: go.UInt32;
    @:native("Groups") var groups: go.UInt32;

function new(family: go.UInt16, pad: go.UInt16, pid: go.UInt32, groups: go.UInt32);

}