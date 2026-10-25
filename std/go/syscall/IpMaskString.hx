package go.syscall;

@:structInit
@:go.Type({ name: "IpMaskString", instanceName: "syscall.IpMaskString", imports: ["syscall"] })
extern class IpMaskString {

    @:native("String") var string: go.GoArray<go.Byte, 16>;

    function new(string: go.GoArray<go.Byte, 16>);

}