package go.net.http;

/**
    A ConnState represents the state of a client connection to a server.
    It's used by the optional [Server.ConnState] hook.
**/
@:go.Type({ name: "ConnState", instanceName: "http.ConnState", imports: ["net/http"] })
extern typedef ConnState = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>