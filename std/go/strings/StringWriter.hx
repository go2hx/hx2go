package go.strings;

@:structInit
@:go.Type({ name: "stringWriter", instanceName: "strings.stringWriter", imports: ["strings"] })
extern class StringWriter {

    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}