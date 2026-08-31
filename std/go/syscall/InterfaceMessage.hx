package go.syscall;

/**
    InterfaceMessage represents a routing message containing
    network interface entries.
    
    Deprecated: Use golang.org/x/net/route instead.
**/
@:structInit
@:go.Type({ name: "InterfaceMessage", instanceName: "syscall.InterfaceMessage", imports: ["syscall"] })
extern class InterfaceMessage {

    @:native("Header") var header: go.syscall.IfMsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.IfMsghdr, data: go.Slice<go.Byte>=null);

}