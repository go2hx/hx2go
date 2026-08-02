package go.net.url;

@:go.Type({ name: "InvalidHostError", instanceName: "url.InvalidHostError", imports: ["net/url"] })
extern typedef InvalidHostError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>