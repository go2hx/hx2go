package go.syscall;

@:structInit
@:go.Type({ name: "IPv6Mreq", instanceName: "syscall.IPv6Mreq", imports: ["syscall"] })
extern class IPv6Mreq {

    @:native("Multiaddr") var multiaddr: go.GoArray<go.Byte, 16>;
    @:native("Interface") var _interface: go.UInt32;

    function new(multiaddr: go.GoArray<go.Byte, 16>, _interface: go.UInt32);

}