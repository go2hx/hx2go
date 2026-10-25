package go.syscall;

@:structInit
@:go.Type({ name: "SIDAndAttributes", instanceName: "syscall.SIDAndAttributes", imports: ["syscall"] })
extern class SIDAndAttributes {

    @:native("Sid") var sid: go.Pointer<go.syscall.SID>;
    @:native("Attributes") var attributes: go.UInt32;

    function new(sid: go.Pointer<go.syscall.SID>=null, attributes: go.UInt32=0);

}