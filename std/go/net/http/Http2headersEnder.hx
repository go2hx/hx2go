package go.net.http;

@:go.Type({ name: "http2headersEnder", instanceName: "http.http2headersEnder", imports: ["net/http"] })
extern typedef Http2headersEnder = {

    @:native("HeadersEnded") function headersEnded(): (Bool);

}