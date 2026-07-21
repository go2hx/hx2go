package go.strings;

@:structInit
@:go.Type({ name: "genericReplacer", instanceName: "strings.genericReplacer", imports: ["strings"] })
extern class GenericReplacer {

    @:native("Replace") function replace(s: String): (String);
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}