package go.archive.zip;

@:structInit
@:go.Type({ name: "nopCloser", instanceName: "zip.nopCloser", imports: ["archive/zip"] })
extern class NopCloser {

    @:native("Writer") var writer: go.io.Writer;

    function new(writer: go.io.Writer);

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}