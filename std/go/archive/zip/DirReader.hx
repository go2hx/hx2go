package go.archive.zip;

@:structInit
@:go.Type({ name: "dirReader", instanceName: "zip.dirReader", imports: ["archive/zip"] })
extern class DirReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}