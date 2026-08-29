package go.crypto.cipher;

/**
    StreamWriter wraps a [Stream] into an io.Writer. It calls XORKeyStream
    to process each slice of data which passes through. If any [StreamWriter.Write]
    call returns short then the StreamWriter is out of sync and must be discarded.
    A StreamWriter has no internal buffering; [StreamWriter.Close] does not need
    to be called to flush write data.
**/
@:structInit
@:go.Type({ name: "StreamWriter", instanceName: "cipher.StreamWriter", imports: ["crypto/cipher"] })
extern class StreamWriter {

    @:native("S") var S: go.crypto.cipher.Stream;
    @:native("W") var W: go.io.Writer;
    @:native("Err") var err: go.Error;

    function new(S: go.crypto.cipher.Stream=null, W: go.io.Writer=null, err: go.Error=null);

    /**
        Close closes the underlying Writer and returns its Close return value, if the Writer
        is also an io.Closer. Otherwise it returns nil.
    **/
    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(src: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}