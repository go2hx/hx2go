package go.io.fs;

@:structInit
@:go.Type({ name: "subFS", instanceName: "fs.subFS", imports: ["io/fs"] })
extern class SubFS_ {

    @:native("Glob") function glob(pattern: String): (go.Result<go.Slice<String>>);
    @:native("Lstat") function lstat(name: String): (go.Result<go.io.fs.FileInfo>);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadDir") function readDir(name: String): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadLink") function readLink(name: String): (go.Result<String>);
    @:native("Sub") function sub(dir: String): (go.Result<go.io.fs.FS>);

}