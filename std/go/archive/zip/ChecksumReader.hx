package go.archive.zip;

@:structInit
@:go.Type({ name: "checksumReader", instanceName: "zip.checksumReader", imports: ["archive/zip"] })
extern class ChecksumReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Stat") function stat(): (go.Result<go.io.fs.FileInfo>);

}