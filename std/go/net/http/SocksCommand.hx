package go.net.http;

@:go.Type({ name: "socksCommand", instanceName: "http.socksCommand", imports: ["net/http"] })
extern typedef SocksCommand = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>