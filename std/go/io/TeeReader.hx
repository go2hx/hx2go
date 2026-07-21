package go.io;

@:structInit
@:go.Type({ name: "teeReader", instanceName: "io.teeReader", imports: ["io"] })
extern class TeeReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}