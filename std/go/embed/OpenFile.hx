package go.embed;

@:structInit
@:go.Type({ name: "openFile", instanceName: "embed.openFile", imports: ["embed"] })
extern class OpenFile {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(b: go.Slice<go.Byte>, offset: go.Int64): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}