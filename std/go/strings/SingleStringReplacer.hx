package go.strings;

@:structInit
@:go.Type({ name: "singleStringReplacer", instanceName: "strings.singleStringReplacer", imports: ["strings"] })
extern class SingleStringReplacer {

    @:native("Replace") function replace(s: String): (String);
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}