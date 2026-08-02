package go.net.http;

@:structInit
@:go.Type({ name: "ioFS", instanceName: "http.ioFS", imports: ["net/http"] })
extern class IoFS {

    @:native("Open") function open(name: String): (go.Result<go.net.http.File>);

}