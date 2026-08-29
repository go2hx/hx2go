package go.compress.lzw;

/**
    Reader is an [io.Reader] which can be used to read compressed data in the
    LZW format.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "lzw.Reader", imports: ["compress/lzw"] })
extern class Reader {

    /**
        Close closes the [Reader] and returns an error for any future read operation.
        It does not close the underlying [io.Reader].
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Read implements io.Reader, reading uncompressed bytes from its underlying reader.
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        Reset clears the [Reader]'s state and allows it to be reused again
        as a new [Reader].
    **/
    @:native("Reset") function reset(src: go.io.Reader, order: go.compress.lzw.Order, litWidth: go.GoInt): Void;

}