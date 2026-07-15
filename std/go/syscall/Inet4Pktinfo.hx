package go.syscall;

@:structInit
@:go.Type({ name: "Inet4Pktinfo", instanceName: "syscall.Inet4Pktinfo", imports: ["syscall"] })
extern class Inet4Pktinfo {

    @:native("Ifindex") var ifindex: go.Int32;
    @:native("Spec_dst") var spec_dst: go.GoArray<go.Byte, 4>;
    @:native("Addr") var addr: go.GoArray<go.Byte, 4>;

function new(ifindex: go.Int32, spec_dst: go.GoArray<go.Byte, 4>, addr: go.GoArray<go.Byte, 4>);

}