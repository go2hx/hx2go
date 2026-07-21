package go.io;

@:structInit
@:go.Type({ name: "discard", instanceName: "io.discard", imports: ["io"] })
extern class Discard {

    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}