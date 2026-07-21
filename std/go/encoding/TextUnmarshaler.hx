package go.encoding;

@:go.Type({ name: "TextUnmarshaler", instanceName: "encoding.TextUnmarshaler", imports: ["encoding"] })
extern typedef TextUnmarshaler = {

    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);

}