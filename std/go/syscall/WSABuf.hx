package go.syscall;

@:structInit
@:go.Type({ name: "WSABuf", instanceName: "syscall.WSABuf", imports: ["syscall"] })
extern class WSABuf {

    @:native("Len") var len: go.UInt32;
    @:native("Buf") var buf: go.Pointer<go.Byte>;

    function new(len: go.UInt32=0, buf: go.Pointer<go.Byte>=null);

}