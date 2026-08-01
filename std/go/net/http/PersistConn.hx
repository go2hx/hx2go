package go.net.http;

@:structInit
@:go.Type({ name: "persistConn", instanceName: "http.persistConn", imports: ["net/http"] })
extern class PersistConn {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}