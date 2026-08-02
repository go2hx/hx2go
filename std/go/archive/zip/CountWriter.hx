package go.archive.zip;

@:structInit
@:go.Type({ name: "countWriter", instanceName: "zip.countWriter", imports: ["archive/zip"] })
extern class CountWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}