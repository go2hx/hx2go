package go.syscall;

@:structInit
@:go.Type({ name: "NetlinkMessage", instanceName: "syscall.NetlinkMessage", imports: ["syscall"] })
extern class NetlinkMessage {

    @:native("Header") var header: go.syscall.NlMsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

function new(header: go.syscall.NlMsghdr, data: go.Slice<go.Byte>);

}