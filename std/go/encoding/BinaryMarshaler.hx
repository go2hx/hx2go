package go.encoding;

@:go.Type({ name: "BinaryMarshaler", instanceName: "encoding.BinaryMarshaler", imports: ["encoding"] })
extern typedef BinaryMarshaler = {

    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;

}