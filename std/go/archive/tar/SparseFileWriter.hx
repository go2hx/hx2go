package go.archive.tar;

@:structInit
@:go.Type({ name: "sparseFileWriter", instanceName: "tar.sparseFileWriter", imports: ["archive/tar"] })
extern class SparseFileWriter {

    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}