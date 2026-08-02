package go.archive.tar;

@:structInit
@:go.Type({ name: "zeroReader", instanceName: "tar.zeroReader", imports: ["archive/tar"] })
extern class ZeroReader {

    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}