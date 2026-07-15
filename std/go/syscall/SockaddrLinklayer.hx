package go.syscall;

@:structInit
@:go.Type({ name: "SockaddrLinklayer", instanceName: "syscall.SockaddrLinklayer", imports: ["syscall"] })
extern class SockaddrLinklayer {

    @:native("Protocol") var protocol: go.UInt16;
    @:native("Ifindex") var ifindex: go.GoInt;
    @:native("Hatype") var hatype: go.UInt16;
    @:native("Pkttype") var pkttype: go.UInt8;
    @:native("Halen") var halen: go.UInt8;
    @:native("Addr") var addr: go.GoArray<go.Byte, 8>;

function new(protocol: go.UInt16, ifindex: go.GoInt, hatype: go.UInt16, pkttype: go.UInt8, halen: go.UInt8, addr: go.GoArray<go.Byte, 8>);

}