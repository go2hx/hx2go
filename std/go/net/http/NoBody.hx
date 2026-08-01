package go.net.http;

@:structInit
@:go.Type({ name: "noBody", instanceName: "http.noBody", imports: ["net/http"] })
extern class NoBody {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(p0: go.io.Writer): (go.Result<go.Int64>);

}