package go.net.http;

@:structInit
@:go.Type({ name: "cancelTimerBody", instanceName: "http.cancelTimerBody", imports: ["net/http"] })
extern class CancelTimerBody {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}