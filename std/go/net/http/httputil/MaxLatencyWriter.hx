package go.net.http.httputil;

@:structInit
@:go.Type({ name: "maxLatencyWriter", instanceName: "httputil.maxLatencyWriter", imports: ["net/http/httputil"] })
extern class MaxLatencyWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}