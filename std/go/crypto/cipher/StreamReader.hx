package go.crypto.cipher;

/**
    StreamReader wraps a [Stream] into an [io.Reader]. It calls XORKeyStream
    to process each slice of data which passes through.
**/
@:structInit
@:go.Type({ name: "StreamReader", instanceName: "cipher.StreamReader", imports: ["crypto/cipher"] })
extern class StreamReader {

    @:native("S") var S: go.crypto.cipher.Stream;
    @:native("R") var R: go.io.Reader;

    function new(S: go.crypto.cipher.Stream=null, R: go.io.Reader=null);

    @:native("Read") function read(dst: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}