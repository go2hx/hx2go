package go.archive.zip;

@:structInit
@:go.Type({ name: "fileListEntry", instanceName: "zip.fileListEntry", imports: ["archive/zip"] })
extern class FileListEntry {

    @:native("Info") function info(): (go.Result<go.io.fs.FileInfo>);
    @:native("IsDir") function isDir(): (Bool);
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.io.fs.FileMode);
    @:native("Name") function name(): (String);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);
    @:native("Sys") function sys(): (Dynamic);
    @:native("Type") function type(): (go.io.fs.FileMode);

}