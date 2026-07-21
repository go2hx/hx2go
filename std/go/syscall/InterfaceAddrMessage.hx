package go.syscall;

@:structInit
@:go.Type({ name: "InterfaceAddrMessage", instanceName: "syscall.InterfaceAddrMessage", imports: ["syscall"] })
extern class InterfaceAddrMessage {

    @:native("Header") var header: go.syscall.IfaMsghdr;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.IfaMsghdr, data: go.Slice<go.Byte>);

}