package go.net.http;

@:go.Type({ name: "http2connectionStater", instanceName: "http.http2connectionStater", imports: ["net/http"] })
extern typedef Http2connectionStater = {

    @:native("ConnectionState") function connectionState(): (go.crypto.tls.ConnectionState);

}