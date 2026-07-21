package go.strings;

@:structInit
@:go.Type({ name: "byteStringReplacer", instanceName: "strings.byteStringReplacer", imports: ["strings"] })
extern class ByteStringReplacer {

    @:native("Replace") function replace(s: String): (String);
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}