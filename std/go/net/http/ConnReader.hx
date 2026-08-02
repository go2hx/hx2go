package go.net.http;

@:structInit
@:go.Type({ name: "connReader", instanceName: "http.connReader", imports: ["net/http"] })
extern class ConnReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}