package go.syscall;

@:structInit
@:go.Type({ name: "SockFprog", instanceName: "syscall.SockFprog", imports: ["syscall"] })
extern class SockFprog {

    @:native("Len") var len: go.UInt16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 6>;
    @:native("Filter") var filter: go.Pointer<go.syscall.SockFilter>;

function new(len: go.UInt16, pad_cgo_0: go.GoArray<go.Byte, 6>, filter: go.Pointer<go.syscall.SockFilter>);

}