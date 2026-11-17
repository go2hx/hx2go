package go.compress.flate;

/**
    A Writer takes data written to it and writes the compressed
    form of that data to an underlying writer (see [NewWriter]).
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "flate.Writer", imports: ["compress/flate"] })
extern class Writer {

    /**
        Close flushes and closes the writer.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Flush flushes any pending data to the underlying writer.
        It is useful mainly in compressed network protocols, to ensure that
        a remote reader has enough data to reconstruct a packet.
        Flush does not return until the data has been written.
        Calling Flush when there is no pending data still causes the [Writer]
        to emit a sync marker of at least 4 bytes.
        If the underlying writer returns an error, Flush returns that error.
        
        In the terminology of the zlib library, Flush is equivalent to Z_SYNC_FLUSH.
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        Reset discards the writer's state and makes it equivalent to
        the result of [NewWriter] or [NewWriterDict] called with dst
        and w's level and dictionary.
    **/
    @:native("Reset") function reset(dst: go.io.Writer): Void;
    /**
        Write writes data to w, which will eventually write the
        compressed form of data to its underlying writer.
    **/
    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}