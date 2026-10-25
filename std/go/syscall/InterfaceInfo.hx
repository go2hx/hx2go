package go.syscall;

@:structInit
@:go.Type({ name: "InterfaceInfo", instanceName: "syscall.InterfaceInfo", imports: ["syscall"] })
extern class InterfaceInfo {

    @:native("Flags") var flags: go.UInt32;
    @:native("Address") var address: go.syscall.SockaddrGen;
    @:native("BroadcastAddress") var broadcastAddress: go.syscall.SockaddrGen;
    @:native("Netmask") var netmask: go.syscall.SockaddrGen;

    function new(flags: go.UInt32=0, address: go.syscall.SockaddrGen, broadcastAddress: go.syscall.SockaddrGen, netmask: go.syscall.SockaddrGen);

}