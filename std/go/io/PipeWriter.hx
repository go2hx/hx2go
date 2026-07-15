package go.io;

@:structInit
@:go.Type({ name: "PipeWriter", instanceName: "io.PipeWriter", imports: ["io"] })
extern class PipeWriter {

    @:native("Close") function close(): go.Error;
    @:native("CloseWithError") function closeWithError(err: go.Error): go.Error;
    @:native("Write") function write(data: go.Slice<go.Byte>): go.Result<go.GoInt>;

}