package go.net.http;

@:go.Type({ name: "http2stringWriter", instanceName: "http.http2stringWriter", imports: ["net/http"] })
extern typedef Http2stringWriter = {

    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}