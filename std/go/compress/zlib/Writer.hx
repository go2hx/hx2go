package go.compress.zlib;

/**
    A Writer takes data written to it and writes the compressed
    form of that data to an underlying writer (see [NewWriter]).
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "zlib.Writer", imports: ["compress/zlib"] })
extern class Writer {

    /**
        Close closes the Writer, flushing any unwritten data to the underlying
        [io.Writer], but does not close the underlying io.Writer.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Flush flushes the Writer to its underlying [io.Writer].
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        Reset clears the state of the [Writer] z such that it is equivalent to its
        initial state from [NewWriterLevel] or [NewWriterLevelDict], but instead writing
        to w.
    **/
    @:native("Reset") function reset(w: go.io.Writer): Void;
    /**
        Write writes a compressed form of p to the underlying [io.Writer]. The
        compressed bytes are not necessarily flushed until the [Writer] is closed or
        explicitly flushed.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}