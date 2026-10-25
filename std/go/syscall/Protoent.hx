package go.syscall;

@:structInit
@:go.Type({ name: "Protoent", instanceName: "syscall.Protoent", imports: ["syscall"] })
extern class Protoent {

    @:native("Name") var name: go.Pointer<go.Byte>;
    @:native("Aliases") var aliases: go.Pointer<go.Pointer<go.Byte>>;
    @:native("Proto") var proto: go.UInt16;

    function new(name: go.Pointer<go.Byte>=null, aliases: go.Pointer<go.Pointer<go.Byte>>=null, proto: go.UInt16=0);

}