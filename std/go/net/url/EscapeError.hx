package go.net.url;

@:go.Type({ name: "EscapeError", instanceName: "url.EscapeError", imports: ["net/url"] })
extern typedef EscapeError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>