package go.syscall;

@:structInit
@:go.Type({ name: "IpAddrString", instanceName: "syscall.IpAddrString", imports: ["syscall"] })
extern class IpAddrString {

    @:native("Next") var next: go.Pointer<go.syscall.IpAddrString>;
    @:native("IpAddress") var ipAddress: go.syscall.IpAddressString;
    @:native("IpMask") var ipMask: go.syscall.IpMaskString;
    @:native("Context") var context: go.UInt32;

    function new(next: go.Pointer<go.syscall.IpAddrString>=null, ipAddress: go.syscall.IpAddressString, ipMask: go.syscall.IpMaskString, context: go.UInt32=0);

}