package go.syscall;

/**
    RouteMessage represents a routing message containing routing
    entries.
    
    Deprecated: Use golang.org/x/net/route instead.
**/
@:structInit
@:go.Type({ name: "RouteMessage", instanceName: "syscall.RouteMessage", imports: ["syscall"] })
extern class RouteMessage {

    @:native("Header") var header: go.syscall.RtMsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.RtMsghdr, data: go.Slice<go.Byte>=null);

}