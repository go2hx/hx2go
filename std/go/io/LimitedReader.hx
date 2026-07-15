package go.io;

@:structInit
@:go.Type({ name: "LimitedReader", instanceName: "io.LimitedReader", imports: ["io"] })
extern class LimitedReader {

    @:native("R") var R: go.io.Reader;
    @:native("N") var N: go.Int64;

function new(R: go.io.Reader, N: go.Int64);

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}