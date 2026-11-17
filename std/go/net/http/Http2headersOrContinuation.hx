package go.net.http;

@:go.Type({ name: "http2headersOrContinuation", instanceName: "http.http2headersOrContinuation", imports: ["net/http"] })
extern typedef Http2headersOrContinuation = {

    @:native("HeaderBlockFragment") function headerBlockFragment(): (go.Slice<go.Byte>);
    @:native("HeadersEnded") function headersEnded(): (Bool);

}