package go.syscall;

@:structInit
@:go.Type({ name: "RouteMessage", instanceName: "syscall.RouteMessage", imports: ["syscall"] })
extern class RouteMessage {

    @:native("Header") var header: go.syscall.RtMsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.RtMsghdr, data: go.Slice<go.Byte>);

}