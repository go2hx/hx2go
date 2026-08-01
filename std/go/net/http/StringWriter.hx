package go.net.http;

@:structInit
@:go.Type({ name: "stringWriter", instanceName: "http.stringWriter", imports: ["net/http"] })
extern class StringWriter {

    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}