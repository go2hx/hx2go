package go.syscall;

@:structInit
@:go.Type({ name: "NlMsghdr", instanceName: "syscall.NlMsghdr", imports: ["syscall"] })
extern class NlMsghdr {

    @:native("Len") var len: go.UInt32;
    @:native("Type") var type: go.UInt16;
    @:native("Flags") var flags: go.UInt16;
    @:native("Seq") var seq: go.UInt32;
    @:native("Pid") var pid: go.UInt32;

function new(len: go.UInt32, type: go.UInt16, flags: go.UInt16, seq: go.UInt32, pid: go.UInt32);

}