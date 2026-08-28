package go.net.http;

/**
    Pusher is the interface implemented by ResponseWriters that support
    HTTP/2 server push. For more background, see
    https://tools.ietf.org/html/rfc7540#section-8.2.
**/
@:go.Type({ name: "Pusher", instanceName: "http.Pusher", imports: ["net/http"] })
extern typedef Pusher = {

    @:native("Push") function push(target: String, opts: go.Pointer<go.net.http.PushOptions>): (go.Error);

}