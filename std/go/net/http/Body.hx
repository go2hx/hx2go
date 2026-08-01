package go.net.http;

@:structInit
@:go.Type({ name: "body", instanceName: "http.body", imports: ["net/http"] })
extern class Body {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}