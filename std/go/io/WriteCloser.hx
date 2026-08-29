package go.io;

/**
    WriteCloser is the interface that groups the basic Write and Close methods.
**/
@:go.Type({ name: "WriteCloser", instanceName: "io.WriteCloser", imports: ["io"] })
extern typedef WriteCloser = {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}