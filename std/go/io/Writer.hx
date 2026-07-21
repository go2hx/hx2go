package go.io;

@:go.Type({ name: "Writer", instanceName: "io.Writer", imports: ["io"] })
extern typedef Writer = {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}