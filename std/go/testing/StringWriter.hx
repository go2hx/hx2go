package go.testing;

@:go.Type({ name: "stringWriter", instanceName: "testing.stringWriter", imports: ["testing"] })
extern typedef StringWriter = {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}