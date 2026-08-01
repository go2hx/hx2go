package go.debug.elf;

@:structInit
@:go.Type({ name: "errorReader", instanceName: "elf.errorReader", imports: ["debug/elf"] })
extern class ErrorReader {

    @:native("Close") function close(): (go.Error);
    @:native("Error") function error(): (String);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);

}