package go.encoding;

/**
    TextAppender is the interface implemented by an object
    that can append the textual representation of itself.
    If a type implements both [TextAppender] and [TextMarshaler],
    then v.MarshalText() must be semantically identical to v.AppendText(nil).
**/
@:go.Type({ name: "TextAppender", instanceName: "encoding.TextAppender", imports: ["encoding"] })
extern typedef TextAppender = {

    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}