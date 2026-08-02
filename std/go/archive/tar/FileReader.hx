package go.archive.tar;

@:go.Type({ name: "fileReader", instanceName: "tar.fileReader", imports: ["archive/tar"] })
extern typedef FileReader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(p0: go.io.Writer): (go.Result<go.Int64>);

}