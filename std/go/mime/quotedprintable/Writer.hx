package go.mime.quotedprintable;

/**
    A Writer is a quoted-printable writer that implements [io.WriteCloser].
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "quotedprintable.Writer", imports: ["mime/quotedprintable"] })
extern class Writer {

    @:native("Binary") var binary: Bool;

    function new(binary: Bool=false);

    /**
        Close closes the [Writer], flushing any unwritten data to the underlying
        [io.Writer], but does not close the underlying io.Writer.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Write encodes p using quoted-printable encoding and writes it to the
        underlying [io.Writer]. It limits line length to 76 characters. The encoded
        bytes are not necessarily flushed until the [Writer] is closed.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}