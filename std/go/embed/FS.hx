package go.embed;

@:structInit
@:go.Type({ name: "FS", instanceName: "embed.FS", imports: ["embed"] })
extern class FS {

    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;
    @:native("ReadDir") function readDir(name: String): go.Result<go.Slice<go.io.fs.DirEntry>>;
    @:native("ReadFile") function readFile(name: String): go.Result<go.Slice<go.Byte>>;

}