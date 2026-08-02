package go.net.http;

@:structInit
@:go.Type({ name: "http2bufferedWriter", instanceName: "http.http2bufferedWriter", imports: ["net/http"] })
extern class Http2bufferedWriter {

    @:native("Available") function available(): (go.GoInt);
    @:native("Flush") function flush(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}