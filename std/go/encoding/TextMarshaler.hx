package go.encoding;

@:go.Type({ name: "TextMarshaler", instanceName: "encoding.TextMarshaler", imports: ["encoding"] })
extern typedef TextMarshaler = {

    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;

}