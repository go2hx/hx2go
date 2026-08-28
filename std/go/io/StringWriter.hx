package go.io;

/**
    StringWriter is the interface that wraps the WriteString method.
**/
@:go.Type({ name: "StringWriter", instanceName: "io.StringWriter", imports: ["io"] })
extern typedef StringWriter = {

    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}