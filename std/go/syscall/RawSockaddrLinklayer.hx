package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrLinklayer", instanceName: "syscall.RawSockaddrLinklayer", imports: ["syscall"] })
extern class RawSockaddrLinklayer {

    @:native("Family") var family: go.UInt16;
    @:native("Protocol") var protocol: go.UInt16;
    @:native("Ifindex") var ifindex: go.Int32;
    @:native("Hatype") var hatype: go.UInt16;
    @:native("Pkttype") var pkttype: go.UInt8;
    @:native("Halen") var halen: go.UInt8;
    @:native("Addr") var addr: go.GoArray<go.UInt8, 8>;

function new(family: go.UInt16, protocol: go.UInt16, ifindex: go.Int32, hatype: go.UInt16, pkttype: go.UInt8, halen: go.UInt8, addr: go.GoArray<go.UInt8, 8>);

}