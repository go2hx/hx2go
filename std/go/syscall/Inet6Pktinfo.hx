package go.syscall;

@:structInit
@:go.Type({ name: "Inet6Pktinfo", instanceName: "syscall.Inet6Pktinfo", imports: ["syscall"] })
extern class Inet6Pktinfo {

    @:native("Addr") var addr: go.GoArray<go.Byte, 16>;
    @:native("Ifindex") var ifindex: go.UInt32;

function new(addr: go.GoArray<go.Byte, 16>, ifindex: go.UInt32);

}