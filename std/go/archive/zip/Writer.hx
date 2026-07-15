package go.archive.zip;

@:structInit
@:go.Type({ name: "Writer", instanceName: "zip.Writer", imports: ["archive/zip"] })
extern class Writer {

    @:native("AddFS") function addFS(fsys: go.io.fs.FS): go.Error;
    @:native("Close") function close(): go.Error;
    @:native("Copy") function copy(f: go.Pointer<go.archive.zip.File>): go.Error;
    @:native("Create") function create(name: String): go.Result<go.io.Writer>;
    @:native("CreateHeader") function createHeader(fh: go.Pointer<go.archive.zip.FileHeader>): go.Result<go.io.Writer>;
    @:native("CreateRaw") function createRaw(fh: go.Pointer<go.archive.zip.FileHeader>): go.Result<go.io.Writer>;
    @:native("Flush") function flush(): go.Error;
    @:native("RegisterCompressor") function registerCompressor(method: go.UInt16, comp: go.archive.zip.Compressor): Void;
    @:native("SetComment") function setComment(comment: String): go.Error;
    @:native("SetOffset") function setOffset(n: go.Int64): Void;

}