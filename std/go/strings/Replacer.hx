package go.strings;

@:structInit
@:go.Type({ name: "Replacer", instanceName: "strings.Replacer", imports: ["strings"] })
extern class Replacer {

    @:native("Replace") function replace(s: String): (String);
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}