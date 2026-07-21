package go.io;

@:structInit
@:go.Type({ name: "nopCloserWriterTo", instanceName: "io.nopCloserWriterTo", imports: ["io"] })
extern class NopCloserWriterTo {

    @:native("Reader") var reader: go.io.Reader;

    function new(reader: go.io.Reader);

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}