package go.archive.tar;

@:structInit
@:go.Type({ name: "zeroWriter", instanceName: "tar.zeroWriter", imports: ["archive/tar"] })
extern class ZeroWriter {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}