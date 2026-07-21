package go.os;

@:structInit
@:go.Type({ name: "rootFS", instanceName: "os.rootFS", imports: ["os"] })
extern class RootFS {

    @:native("Lstat") function lstat(name: String): (go.Result<go.os.FileInfo>);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadDir") function readDir(name: String): (go.Result<go.Slice<go.os.DirEntry>>);
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadLink") function readLink(name: String): (go.Result<String>);
    @:native("Stat") function stat(name: String): (go.Result<go.os.FileInfo>);

}