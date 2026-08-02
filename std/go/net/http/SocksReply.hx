package go.net.http;

@:go.Type({ name: "socksReply", instanceName: "http.socksReply", imports: ["net/http"] })
extern typedef SocksReply = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>