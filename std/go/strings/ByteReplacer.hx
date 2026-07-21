package go.strings;

@:go.Type({ name: "byteReplacer", instanceName: "strings.byteReplacer", imports: ["strings"] })
extern class ByteReplacer {

    @:native("Replace") function replace(s: String): (String);
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}