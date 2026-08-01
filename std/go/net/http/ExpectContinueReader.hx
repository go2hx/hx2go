package go.net.http;

@:structInit
@:go.Type({ name: "expectContinueReader", instanceName: "http.expectContinueReader", imports: ["net/http"] })
extern class ExpectContinueReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}