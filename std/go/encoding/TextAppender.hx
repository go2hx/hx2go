package go.encoding;

@:go.Type({ name: "TextAppender", instanceName: "encoding.TextAppender", imports: ["encoding"] })
extern typedef TextAppender = {

    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}