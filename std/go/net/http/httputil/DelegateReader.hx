package go.net.http.httputil;

@:structInit
@:go.Type({ name: "delegateReader", instanceName: "httputil.delegateReader", imports: ["net/http/httputil"] })
extern class DelegateReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}