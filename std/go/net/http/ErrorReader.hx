package go.net.http;

@:structInit
@:go.Type({ name: "errorReader", instanceName: "http.errorReader", imports: ["net/http"] })
extern class ErrorReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}