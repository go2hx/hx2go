package go.net.http;

@:go.Type({ name: "FileSystem", instanceName: "http.FileSystem", imports: ["net/http"] })
extern typedef FileSystem = {

    @:native("Open") function open(name: String): go.Result<go.net.http.File>;

}