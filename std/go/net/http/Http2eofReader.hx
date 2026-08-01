package go.net.http;

@:structInit
@:go.Type({ name: "http2eofReader", instanceName: "http.http2eofReader", imports: ["net/http"] })
extern class Http2eofReader {

    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}