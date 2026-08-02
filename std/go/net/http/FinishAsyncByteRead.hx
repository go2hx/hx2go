package go.net.http;

@:structInit
@:go.Type({ name: "finishAsyncByteRead", instanceName: "http.finishAsyncByteRead", imports: ["net/http"] })
extern class FinishAsyncByteRead {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}