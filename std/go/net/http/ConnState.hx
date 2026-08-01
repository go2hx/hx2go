package go.net.http;

@:go.Type({ name: "ConnState", instanceName: "http.ConnState", imports: ["net/http"] })
extern typedef ConnState = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>