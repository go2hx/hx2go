package go.net.http;

@:go.Type({ name: "Dir", instanceName: "http.Dir", imports: ["net/http"] })
extern typedef Dir = haxe.extern.EitherType<String, {
    @:native("Open") function open(name: String): (go.Result<go.net.http.File>);

}>