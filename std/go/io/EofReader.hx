package go.io;

@:structInit
@:go.Type({ name: "eofReader", instanceName: "io.eofReader", imports: ["io"] })
extern class EofReader {

    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}