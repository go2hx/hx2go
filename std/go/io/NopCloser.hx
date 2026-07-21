package go.io;

@:structInit
@:go.Type({ name: "nopCloser", instanceName: "io.nopCloser", imports: ["io"] })
extern class NopCloser {

    @:native("Reader") var reader: go.io.Reader;

    function new(reader: go.io.Reader);

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}