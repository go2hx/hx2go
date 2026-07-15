package go.syscall;

@:structInit
@:go.Type({ name: "IPMreq", instanceName: "syscall.IPMreq", imports: ["syscall"] })
extern class IPMreq {

    @:native("Multiaddr") var multiaddr: go.GoArray<go.Byte, 4>;
    @:native("Interface") var iface: go.GoArray<go.Byte, 4>;

function new(multiaddr: go.GoArray<go.Byte, 4>, iface: go.GoArray<go.Byte, 4>);

}