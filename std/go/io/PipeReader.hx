package go.io;

@:structInit
@:go.Type({ name: "PipeReader", instanceName: "io.PipeReader", imports: ["io"] })
extern class PipeReader {

    @:native("Close") function close(): (go.Error);
    @:native("CloseWithError") function closeWithError(err: go.Error): (go.Error);
    @:native("Read") function read(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}