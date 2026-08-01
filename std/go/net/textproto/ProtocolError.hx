package go.net.textproto;

@:go.Type({ name: "ProtocolError", instanceName: "textproto.ProtocolError", imports: ["net/textproto"] })
extern typedef ProtocolError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>