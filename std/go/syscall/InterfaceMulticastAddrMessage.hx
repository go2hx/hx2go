package go.syscall;

@:structInit
@:go.Type({ name: "InterfaceMulticastAddrMessage", instanceName: "syscall.InterfaceMulticastAddrMessage", imports: ["syscall"] })
extern class InterfaceMulticastAddrMessage {

    @:native("Header") var header: go.syscall.IfmaMsghdr2;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(header: go.syscall.IfmaMsghdr2, data: go.Slice<go.Byte>);

}