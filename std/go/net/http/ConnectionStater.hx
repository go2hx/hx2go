package go.net.http;

@:go.Type({ name: "connectionStater", instanceName: "http.connectionStater", imports: ["net/http"] })
extern typedef ConnectionStater = {

    @:native("ConnectionState") function connectionState(): (go.crypto.tls.ConnectionState);

}