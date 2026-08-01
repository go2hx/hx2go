package go.embed;

@:structInit
@:go.Type({ name: "openDir", instanceName: "embed.openDir", imports: ["embed"] })
extern class OpenDir {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadDir") function readDir(count: go.GoInt): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}