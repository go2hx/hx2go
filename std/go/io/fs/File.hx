package go.io.fs;

/**
    A File provides access to a single file.
    The File interface is the minimum implementation required of the file.
    Directory files should also implement [ReadDirFile].
    A file may implement [io.ReaderAt] or [io.Seeker] as optimizations.
**/
@:go.Type({ name: "File", instanceName: "fs.File", imports: ["io/fs"] })
extern typedef File = {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}