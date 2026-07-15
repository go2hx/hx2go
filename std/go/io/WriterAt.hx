package go.io;

@:go.Type({ name: "WriterAt", instanceName: "io.WriterAt", imports: ["io"] })
extern typedef WriterAt = {

    @:native("WriteAt") function writeAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}