package go.io.fs;

/**
    A ReadDirFile is a directory file whose entries can be read with the ReadDir method.
    Every directory file should implement this interface.
    (It is permissible for any file to implement this interface,
    but if so ReadDir should return an error for non-directories.)
**/
@:go.Type({ name: "ReadDirFile", instanceName: "fs.ReadDirFile", imports: ["io/fs"] })
extern typedef ReadDirFile = {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadDir") function readDir(n: go.GoInt): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}