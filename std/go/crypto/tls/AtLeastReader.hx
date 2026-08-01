package go.crypto.tls;

@:structInit
@:go.Type({ name: "atLeastReader", instanceName: "tls.atLeastReader", imports: ["crypto/tls"] })
extern class AtLeastReader {

    @:native("R") var R: go.io.Reader;
    @:native("N") var N: go.Int64;

    function new(R: go.io.Reader, N: go.Int64);

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}