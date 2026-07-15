package go.testing.fstest;

@:go.Type({ name: "MapFS", instanceName: "fstest.MapFS", imports: ["testing/fstest"] })
extern class MapFS {

    @:native("Glob") function glob(pattern: String): go.Result<go.Slice<String>>;
    @:native("Lstat") function lstat(name: String): go.Result<go.io.fs.FileInfo>;
    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;
    @:native("ReadDir") function readDir(name: String): go.Result<go.Slice<go.io.fs.DirEntry>>;
    @:native("ReadFile") function readFile(name: String): go.Result<go.Slice<go.Byte>>;
    @:native("ReadLink") function readLink(name: String): go.Result<String>;
    @:native("Stat") function stat(name: String): go.Result<go.io.fs.FileInfo>;
    @:native("Sub") function sub(dir: String): go.Result<go.io.fs.FS>;

}