package go.encoding;

/**
    BinaryAppender is the interface implemented by an object
    that can append the binary representation of itself.
    If a type implements both [BinaryAppender] and [BinaryMarshaler],
    then v.MarshalBinary() must be semantically identical to v.AppendBinary(nil).
**/
@:go.Type({ name: "BinaryAppender", instanceName: "encoding.BinaryAppender", imports: ["encoding"] })
extern typedef BinaryAppender = {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}