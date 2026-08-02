package go.net.http;

@:structInit
@:go.Type({ name: "checkConnErrorWriter", instanceName: "http.checkConnErrorWriter", imports: ["net/http"] })
extern class CheckConnErrorWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}