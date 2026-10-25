package go.syscall;

@:structInit
@:go.Type({ name: "IpAddressString", instanceName: "syscall.IpAddressString", imports: ["syscall"] })
extern class IpAddressString {

    @:native("String") var string: go.GoArray<go.Byte, 16>;

    function new(string: go.GoArray<go.Byte, 16>);

}