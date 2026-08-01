package go.archive.zip;

@:structInit
@:go.Type({ name: "dirWriter", instanceName: "zip.dirWriter", imports: ["archive/zip"] })
extern class DirWriter {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}