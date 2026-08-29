package go.mime;

/**
    A WordEncoder is an RFC 2047 encoded-word encoder.
**/
@:go.Type({ name: "WordEncoder", instanceName: "mime.WordEncoder", imports: ["mime"] })
extern typedef WordEncoder = haxe.extern.EitherType<go.Byte, {
    /**
        Encode returns the encoded-word form of s. If s is ASCII without special
        characters, it is returned unchanged. The provided charset is the IANA
        charset name of s. It is case insensitive.
    **/
    @:native("Encode") function encode(charset: String, s: String): (String);

}>