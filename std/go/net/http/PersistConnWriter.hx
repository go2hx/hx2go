package go.net.http;

@:structInit
@:go.Type({ name: "persistConnWriter", instanceName: "http.persistConnWriter", imports: ["net/http"] })
extern class PersistConnWriter {

    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}