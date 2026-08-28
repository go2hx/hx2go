package go.compress.gzip;

/**
    A Writer is an [io.WriteCloser].
    Writes to a Writer are compressed and written to w.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "gzip.Writer", imports: ["compress/gzip"] })
extern class Writer {

    @:native("Header") var header: go.compress.gzip.Header;
    @:native("Comment") var comment: String;
    @:native("Extra") var extra: go.Slice<go.Byte>;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("Name") var name: String;
    @:native("OS") var OS: go.Byte;

    function new(header: go.compress.gzip.Header);

    /**
        Close closes the [Writer] by flushing any unwritten data to the underlying
        [io.Writer] and writing the GZIP footer.
        It does not close the underlying [io.Writer].
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Flush flushes any pending compressed data to the underlying writer.
        
        It is useful mainly in compressed network protocols, to ensure that
        a remote reader has enough data to reconstruct a packet. Flush does
        not return until the data has been written. If the underlying
        writer returns an error, Flush returns that error.
        
        In the terminology of the zlib library, Flush is equivalent to Z_SYNC_FLUSH.
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        Reset discards the [Writer] z's state and makes it equivalent to the
        result of its original state from [NewWriter] or [NewWriterLevel], but
        writing to w instead. This permits reusing a [Writer] rather than
        allocating a new one.
    **/
    @:native("Reset") function reset(w: go.io.Writer): Void;
    /**
        Write writes a compressed form of p to the underlying [io.Writer]. The
        compressed bytes are not necessarily flushed until the [Writer] is closed.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}