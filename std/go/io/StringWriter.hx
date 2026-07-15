package go.io;

@:go.Type({ name: "StringWriter", instanceName: "io.StringWriter", imports: ["io"] })
extern typedef StringWriter = {

    @:native("WriteString") function writeString(s: String): go.Result<go.GoInt>;

}