package go.archive.tar;

@:structInit
@:go.Type({ name: "Writer", instanceName: "tar.Writer", imports: ["archive/tar"] })
extern class Writer {

    @:native("AddFS") function addFS(fsys: go.io.fs.FS): go.Error;
    @:native("Close") function close(): go.Error;
    @:native("Flush") function flush(): go.Error;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteHeader") function writeHeader(hdr: go.Pointer<go.archive.tar.Header>): go.Error;

}