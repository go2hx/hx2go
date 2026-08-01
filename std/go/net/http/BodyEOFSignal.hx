package go.net.http;

@:structInit
@:go.Type({ name: "bodyEOFSignal", instanceName: "http.bodyEOFSignal", imports: ["net/http"] })
extern class BodyEOFSignal {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}