package go.archive.tar;

@:go.Type({ name: "fileWriter", instanceName: "tar.fileWriter", imports: ["archive/tar"] })
extern typedef FileWriter = {

    @:native("ReadFrom") function readFrom(p0: go.io.Reader): (go.Result<go.Int64>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}