package go.syscall;

/**
    InterfaceAddrMessage represents a routing message containing
    network interface address entries.
    
    Deprecated: Use golang.org/x/net/route instead.
**/
@:structInit
@:go.Type({ name: "InterfaceAddrMessage", instanceName: "syscall.InterfaceAddrMessage", imports: ["syscall"] })
extern class InterfaceAddrMessage {

    @:native("Header") var header: go.syscall.IfaMsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.IfaMsghdr, data: go.Slice<go.Byte>=null);

}