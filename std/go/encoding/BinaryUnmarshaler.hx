package go.encoding;

@:go.Type({ name: "BinaryUnmarshaler", instanceName: "encoding.BinaryUnmarshaler", imports: ["encoding"] })
extern typedef BinaryUnmarshaler = {

    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);

}