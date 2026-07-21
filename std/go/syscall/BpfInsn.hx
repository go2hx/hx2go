package go.syscall;

@:structInit
@:go.Type({ name: "BpfInsn", instanceName: "syscall.BpfInsn", imports: ["syscall"] })
extern class BpfInsn {

    @:native("Code") var code: go.UInt16;
    @:native("Jt") var jt: go.UInt8;
    @:native("Jf") var jf: go.UInt8;
    @:native("K") var K: go.UInt32;

    function new(code: go.UInt16, jt: go.UInt8, jf: go.UInt8, K: go.UInt32);

}