package go.testing.fstest;

@:structInit
@:go.Type({ name: "openMapFile", instanceName: "fstest.openMapFile", imports: ["testing/fstest"] })
extern class OpenMapFile {

    @:native("Close") function close(): (go.Error);
    @:native("Info") function info(): (go.Result<go.io.fs.FileInfo>);
    @:native("IsDir") function isDir(): (Bool);
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.io.fs.FileMode);
    @:native("Name") function name(): (String);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(b: go.Slice<go.Byte>, offset: go.Int64): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Size") function size(): (go.Int64);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);
    @:native("String") function string(): (String);
    @:native("Sys") function sys(): (Dynamic);
    @:native("Type") function type(): (go.io.fs.FileMode);

}