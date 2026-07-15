package go.syscall;

@:structInit
@:go.Type({ name: "NetlinkRouteAttr", instanceName: "syscall.NetlinkRouteAttr", imports: ["syscall"] })
extern class NetlinkRouteAttr {

    @:native("Attr") var attr: go.syscall.RtAttr;
    @:native("Value") var value: go.Slice<go.Byte>;

function new(attr: go.syscall.RtAttr, value: go.Slice<go.Byte>);

}