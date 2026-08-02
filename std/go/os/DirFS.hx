package go.os;

@:go.Type({ name: "dirFS", instanceName: "os.dirFS", imports: ["os"] })
extern typedef DirFS = haxe.extern.EitherType<String, {
    @:native("Lstat") function lstat(name: String): (go.Result<go.io.fs.FileInfo>);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadDir") function readDir(name: String): (go.Result<go.Slice<go.os.DirEntry>>);
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadLink") function readLink(name: String): (go.Result<String>);
    @:native("Stat") function stat(name: String): (go.Result<go.io.fs.FileInfo>);

}>