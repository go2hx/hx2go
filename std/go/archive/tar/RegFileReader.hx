package go.archive.tar;

@:structInit
@:go.Type({ name: "regFileReader", instanceName: "tar.regFileReader", imports: ["archive/tar"] })
extern class RegFileReader {

    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}