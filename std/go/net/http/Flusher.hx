package go.net.http;

@:go.Type({ name: "Flusher", instanceName: "http.Flusher", imports: ["net/http"] })
extern typedef Flusher = {

    @:native("Flush") function flush(): Void;

}