package go.net.http;

@:structInit
@:go.Type({ name: "bodyLocked", instanceName: "http.bodyLocked", imports: ["net/http"] })
extern class BodyLocked {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}