package go.compress.lzw;

/**
    Writer is an LZW compressor. It writes the compressed form of the data
    to an underlying writer (see [NewWriter]).
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "lzw.Writer", imports: ["compress/lzw"] })
extern class Writer {

    /**
        Close closes the [Writer], flushing any pending output. It does not close
        w's underlying writer.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Reset clears the [Writer]'s state and allows it to be reused again
        as a new [Writer].
    **/
    @:native("Reset") function reset(dst: go.io.Writer, order: go.compress.lzw.Order, litWidth: go.GoInt): Void;
    /**
        Write writes a compressed representation of p to w's underlying writer.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}