package go.syscall;

@:structInit
@:go.Type({ name: "Fstore_t", instanceName: "syscall.Fstore_t", imports: ["syscall"] })
extern class Fstore_t {

    @:native("Flags") var flags: go.UInt32;
    @:native("Posmode") var posmode: go.Int32;
    @:native("Offset") var offset: go.Int64;
    @:native("Length") var length: go.Int64;
    @:native("Bytesalloc") var bytesalloc: go.Int64;

    function new(flags: go.UInt32, posmode: go.Int32, offset: go.Int64, length: go.Int64, bytesalloc: go.Int64);

}