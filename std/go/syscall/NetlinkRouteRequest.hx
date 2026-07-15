package go.syscall;

@:structInit
@:go.Type({ name: "NetlinkRouteRequest", instanceName: "syscall.NetlinkRouteRequest", imports: ["syscall"] })
extern class NetlinkRouteRequest {

    @:native("Header") var header: go.syscall.NlMsghdr;
    @:native("Data") var data: go.syscall.RtGenmsg;

function new(header: go.syscall.NlMsghdr, data: go.syscall.RtGenmsg);

}