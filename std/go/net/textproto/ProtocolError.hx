package go.net.textproto;

/**
    A ProtocolError describes a protocol violation such
    as an invalid response or a hung-up connection.
**/
@:go.Type({ name: "ProtocolError", instanceName: "textproto.ProtocolError", imports: ["net/textproto"] })
extern typedef ProtocolError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>