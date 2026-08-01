package go.net.http;

@:structInit
@:go.Type({ name: "bufioFlushWriter", instanceName: "http.bufioFlushWriter", imports: ["net/http"] })
extern class BufioFlushWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}