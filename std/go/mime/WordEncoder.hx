package go.mime;

@:go.Type({ name: "WordEncoder", instanceName: "mime.WordEncoder", imports: ["mime"] })
extern typedef WordEncoder = haxe.extern.EitherType<go.Byte, {
    @:native("Encode") function encode(charset: String, s: String): (String);

}>