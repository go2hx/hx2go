package go.crypto.cipher;

@:structInit
@:go.Type({ name: "StreamReader", instanceName: "cipher.StreamReader", imports: ["crypto/cipher"] })
extern class StreamReader {

    @:native("S") var S: go.crypto.cipher.Stream;
    @:native("R") var R: go.io.Reader;

function new(S: go.crypto.cipher.Stream, R: go.io.Reader);

    @:native("Read") function read(dst: go.Slice<go.Byte>): go.Result<go.GoInt>;

}