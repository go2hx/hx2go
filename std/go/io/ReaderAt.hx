package go.io;

@:go.Type({ name: "ReaderAt", instanceName: "io.ReaderAt", imports: ["io"] })
extern typedef ReaderAt = {

    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}