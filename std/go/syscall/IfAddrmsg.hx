package go.syscall;

@:structInit
@:go.Type({ name: "IfAddrmsg", instanceName: "syscall.IfAddrmsg", imports: ["syscall"] })
extern class IfAddrmsg {

    @:native("Family") var family: go.UInt8;
    @:native("Prefixlen") var prefixlen: go.UInt8;
    @:native("Flags") var flags: go.UInt8;
    @:native("Scope") var scope: go.UInt8;
    @:native("Index") var index: go.UInt32;

function new(family: go.UInt8, prefixlen: go.UInt8, flags: go.UInt8, scope: go.UInt8, index: go.UInt32);

}