package go.testing.fstest;

@:structInit
@:go.Type({ name: "mapDir", instanceName: "fstest.mapDir", imports: ["testing/fstest"] })
extern class MapDir {

    @:native("Close") function close(): (go.Error);
    @:native("Info") function info(): (go.Result<go.io.fs.FileInfo>);
    @:native("IsDir") function isDir(): (Bool);
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.io.fs.FileMode);
    @:native("Name") function name(): (String);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadDir") function readDir(count: go.GoInt): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("Size") function size(): (go.Int64);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);
    @:native("String") function string(): (String);
    @:native("Sys") function sys(): (Dynamic);
    @:native("Type") function type(): (go.io.fs.FileMode);

}