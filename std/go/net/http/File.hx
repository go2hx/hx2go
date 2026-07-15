package go.net.http;

@:go.Type({ name: "File", instanceName: "http.File", imports: ["net/http"] })
extern typedef File = {

    @:native("Close") function close(): go.Error;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Readdir") function readdir(count: go.GoInt): go.Result<go.Slice<go.io.fs.FileInfo>>;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;
    @:native("Stat") function stat(): go.Result<go.io.fs.FileInfo>;

}