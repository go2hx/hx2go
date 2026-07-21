package go.strings;

@:go.Type({ name: "replacer", instanceName: "strings.replacer", imports: ["strings"] })
extern typedef Replacer_ = {

    @:native("Replace") function replace(s: String): (String);
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}