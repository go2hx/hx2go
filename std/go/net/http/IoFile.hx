package go.net.http;

@:structInit
@:go.Type({ name: "ioFile", instanceName: "http.ioFile", imports: ["net/http"] })
extern class IoFile {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadDir") function readDir(count: go.GoInt): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("Readdir") function readdir(count: go.GoInt): (go.Result<go.Slice<go.io.fs.FileInfo>>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}