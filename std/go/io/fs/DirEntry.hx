package go.io.fs;

/**
    A DirEntry is an entry read from a directory
    (using the [ReadDir] function or a [ReadDirFile]'s ReadDir method).
**/
@:go.Type({ name: "DirEntry", instanceName: "fs.DirEntry", imports: ["io/fs"] })
extern typedef DirEntry = {

    @:native("Info") function info(): (go.Result<go.io.fs.FileInfo>);
    @:native("IsDir") function isDir(): (Bool);
    @:native("Name") function name(): (String);
    @:native("Type") function type(): (go.io.fs.FileMode);

}