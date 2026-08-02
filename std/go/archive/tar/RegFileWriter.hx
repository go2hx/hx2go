package go.archive.tar;

@:structInit
@:go.Type({ name: "regFileWriter", instanceName: "tar.regFileWriter", imports: ["archive/tar"] })
extern class RegFileWriter {

    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}