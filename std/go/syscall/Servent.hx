package go.syscall;

@:structInit
@:go.Type({ name: "Servent", instanceName: "syscall.Servent", imports: ["syscall"] })
extern class Servent {

    @:native("Name") var name: go.Pointer<go.Byte>;
    @:native("Aliases") var aliases: go.Pointer<go.Pointer<go.Byte>>;
    @:native("Proto") var proto: go.Pointer<go.Byte>;
    @:native("Port") var port: go.UInt16;

    function new(name: go.Pointer<go.Byte>=null, aliases: go.Pointer<go.Pointer<go.Byte>>=null, proto: go.Pointer<go.Byte>=null, port: go.UInt16=0);

}