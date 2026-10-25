package go.syscall;

@:structInit
@:go.Type({ name: "Hostent", instanceName: "syscall.Hostent", imports: ["syscall"] })
extern class Hostent {

    @:native("Name") var name: go.Pointer<go.Byte>;
    @:native("Aliases") var aliases: go.Pointer<go.Pointer<go.Byte>>;
    @:native("AddrType") var addrType: go.UInt16;
    @:native("Length") var length: go.UInt16;
    @:native("AddrList") var addrList: go.Pointer<go.Pointer<go.Byte>>;

    function new(name: go.Pointer<go.Byte>=null, aliases: go.Pointer<go.Pointer<go.Byte>>=null, addrType: go.UInt16=0, length: go.UInt16=0, addrList: go.Pointer<go.Pointer<go.Byte>>=null);

}