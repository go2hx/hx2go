package go.net.http;

@:structInit
@:go.Type({ name: "eofReader", instanceName: "http.eofReader", imports: ["net/http"] })
extern class EofReader {

    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}