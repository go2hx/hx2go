package go.net.http;

@:structInit
@:go.Type({ name: "timeoutWriter", instanceName: "http.timeoutWriter", imports: ["net/http"] })
extern class TimeoutWriter {

    @:native("Header") function header(): (go.net.http.Header);
    @:native("Push") function push(target: String, opts: go.Pointer<go.net.http.PushOptions>): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;

}