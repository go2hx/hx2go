package go.archive.tar;

@:structInit
@:go.Type({ name: "sparseFileReader", instanceName: "tar.sparseFileReader", imports: ["archive/tar"] })
extern class SparseFileReader {

    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}