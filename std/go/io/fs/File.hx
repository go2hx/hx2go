package go.io.fs;

@:go.Type({ name: "File", instanceName: "fs.File", imports: ["io/fs"] })
extern typedef File = {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}