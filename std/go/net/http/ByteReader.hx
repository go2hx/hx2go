package go.net.http;

@:structInit
@:go.Type({ name: "byteReader", instanceName: "http.byteReader", imports: ["net/http"] })
extern class ByteReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}