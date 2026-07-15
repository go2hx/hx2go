package go.syscall;

@:structInit
@:go.Type({ name: "RtNexthop", instanceName: "syscall.RtNexthop", imports: ["syscall"] })
extern class RtNexthop {

    @:native("Len") var len: go.UInt16;
    @:native("Flags") var flags: go.UInt8;
    @:native("Hops") var hops: go.UInt8;
    @:native("Ifindex") var ifindex: go.Int32;

function new(len: go.UInt16, flags: go.UInt8, hops: go.UInt8, ifindex: go.Int32);

}