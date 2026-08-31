package go.io;

/**
    ReadCloser is the interface that groups the basic Read and Close methods.
**/
@:go.Type({ name: "ReadCloser", instanceName: "io.ReadCloser", imports: ["io"] })
extern typedef ReadCloser = {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}