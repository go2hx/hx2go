package go.syscall;

@:structInit
@:go.Type({ name: "SocketControlMessage", instanceName: "syscall.SocketControlMessage", imports: ["syscall"] })
extern class SocketControlMessage {

    @:native("Header") var header: go.syscall.Cmsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.Cmsghdr, data: go.Slice<go.Byte>);

}