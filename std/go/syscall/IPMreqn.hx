package go.syscall;

@:structInit
@:go.Type({ name: "IPMreqn", instanceName: "syscall.IPMreqn", imports: ["syscall"] })
extern class IPMreqn {

    @:native("Multiaddr") var multiaddr: go.GoArray<go.Byte, 4>;
    @:native("Address") var address: go.GoArray<go.Byte, 4>;
    @:native("Ifindex") var ifindex: go.Int32;

function new(multiaddr: go.GoArray<go.Byte, 4>, address: go.GoArray<go.Byte, 4>, ifindex: go.Int32);

}