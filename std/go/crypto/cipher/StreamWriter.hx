package go.crypto.cipher;

@:structInit
@:go.Type({ name: "StreamWriter", instanceName: "cipher.StreamWriter", imports: ["crypto/cipher"] })
extern class StreamWriter {

    @:native("S") var S: go.crypto.cipher.Stream;
    @:native("W") var W: go.io.Writer;
    @:native("Err") var err: go.Error;

function new(S: go.crypto.cipher.Stream, W: go.io.Writer, err: go.Error);

    @:native("Close") function close(): go.Error;
    @:native("Write") function write(src: go.Slice<go.Byte>): go.Result<go.GoInt>;

}