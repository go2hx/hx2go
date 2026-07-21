package go.syscall;

@:structInit
@:go.Type({ name: "IPv6MTUInfo", instanceName: "syscall.IPv6MTUInfo", imports: ["syscall"] })
extern class IPv6MTUInfo {

    @:native("Addr") var addr: go.syscall.RawSockaddrInet6;
    @:native("Mtu") var mtu: go.UInt32;

    function new(addr: go.syscall.RawSockaddrInet6, mtu: go.UInt32);

}