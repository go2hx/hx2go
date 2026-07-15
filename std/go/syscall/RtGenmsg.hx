package go.syscall;

@:structInit
@:go.Type({ name: "RtGenmsg", instanceName: "syscall.RtGenmsg", imports: ["syscall"] })
extern class RtGenmsg {

    @:native("Family") var family: go.UInt8;

function new(family: go.UInt8);

}