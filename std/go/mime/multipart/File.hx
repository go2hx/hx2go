package go.mime.multipart;

@:go.Type({ name: "File", instanceName: "multipart.File", imports: ["mime/multipart"] })
extern typedef File = {

    @:native("Close") function close(): go.Error;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;

}