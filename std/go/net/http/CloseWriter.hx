package go.net.http;

@:go.Type({ name: "closeWriter", instanceName: "http.closeWriter", imports: ["net/http"] })
extern typedef CloseWriter = {

    @:native("CloseWrite") function closeWrite(): (go.Error);

}