package go.encoding;

@:go.Type({ name: "BinaryAppender", instanceName: "encoding.BinaryAppender", imports: ["encoding"] })
extern typedef BinaryAppender = {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}