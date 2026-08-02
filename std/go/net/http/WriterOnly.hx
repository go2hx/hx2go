package go.net.http;

@:structInit
@:go.Type({ name: "writerOnly", instanceName: "http.writerOnly", imports: ["net/http"] })
extern class WriterOnly {

    @:native("Writer") var writer: go.io.Writer;

    function new(writer: go.io.Writer);

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}