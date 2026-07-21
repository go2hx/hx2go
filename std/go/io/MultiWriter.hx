package go.io;

@:structInit
@:go.Type({ name: "multiWriter", instanceName: "io.multiWriter", imports: ["io"] })
extern class MultiWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}