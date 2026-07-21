package go.strings;

@:go.Type({ name: "appendSliceWriter", instanceName: "strings.appendSliceWriter", imports: ["strings"] })
extern class AppendSliceWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}