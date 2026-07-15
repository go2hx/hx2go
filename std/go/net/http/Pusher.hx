package go.net.http;

@:go.Type({ name: "Pusher", instanceName: "http.Pusher", imports: ["net/http"] })
extern typedef Pusher = {

    @:native("Push") function push(target: String, opts: go.Pointer<go.net.http.PushOptions>): go.Error;

}