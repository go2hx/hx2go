package go.syscall;

@:structInit
@:go.Type({ name: "Fbootstraptransfer_t", instanceName: "syscall.Fbootstraptransfer_t", imports: ["syscall"] })
extern class Fbootstraptransfer_t {

    @:native("Offset") var offset: go.Int64;
    @:native("Length") var length: go.UInt64;
    @:native("Buffer") var buffer: go.Pointer<go.Byte>;

    function new(offset: go.Int64, length: go.UInt64, buffer: go.Pointer<go.Byte>);

}