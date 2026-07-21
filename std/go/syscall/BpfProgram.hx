package go.syscall;

@:structInit
@:go.Type({ name: "BpfProgram", instanceName: "syscall.BpfProgram", imports: ["syscall"] })
extern class BpfProgram {

    @:native("Len") var len: go.UInt32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Insns") var insns: go.Pointer<go.syscall.BpfInsn>;

    function new(len: go.UInt32, pad_cgo_0: go.GoArray<go.Byte, 4>, insns: go.Pointer<go.syscall.BpfInsn>);

}