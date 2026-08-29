package go.bufio;

/**
    Writer implements buffering for an [io.Writer] object.
    If an error occurs writing to a [Writer], no more data will be
    accepted and all subsequent writes, and [Writer.Flush], will return the error.
    After all data has been written, the client should call the
    [Writer.Flush] method to guarantee all data has been forwarded to
    the underlying [io.Writer].
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "bufio.Writer", imports: ["bufio"] })
extern class Writer {

    /**
        Available returns how many bytes are unused in the buffer.
    **/
    @:native("Available") function available(): (go.GoInt);
    /**
        AvailableBuffer returns an empty buffer with b.Available() capacity.
        This buffer is intended to be appended to and
        passed to an immediately succeeding [Writer.Write] call.
        The buffer is only valid until the next write operation on b.
    **/
    @:native("AvailableBuffer") function availableBuffer(): (go.Slice<go.Byte>);
    /**
        Buffered returns the number of bytes that have been written into the current buffer.
    **/
    @:native("Buffered") function buffered(): (go.GoInt);
    /**
        Flush writes any buffered data to the underlying [io.Writer].
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        ReadFrom implements [io.ReaderFrom]. If the underlying writer
        supports the ReadFrom method, this calls the underlying ReadFrom.
        If there is buffered data and an underlying ReadFrom, this fills
        the buffer and writes it before calling ReadFrom.
    **/
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    /**
        Reset discards any unflushed buffered data, clears any error, and
        resets b to write its output to w.
        Calling Reset on the zero value of [Writer] initializes the internal buffer
        to the default size.
        Calling w.Reset(w) (that is, resetting a [Writer] to itself) does nothing.
    **/
    @:native("Reset") function reset(w: go.io.Writer): Void;
    /**
        Size returns the size of the underlying buffer in bytes.
    **/
    @:native("Size") function size(): (go.GoInt);
    /**
        Write writes the contents of p into the buffer.
        It returns the number of bytes written.
        If nn < len(p), it also returns an error explaining
        why the write is short.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteByte writes a single byte.
    **/
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    /**
        WriteRune writes a single Unicode code point, returning
        the number of bytes written and any error.
    **/
    @:native("WriteRune") function writeRune(r: go.Rune): (go.Result<go.GoInt>);
    /**
        WriteString writes a string.
        It returns the number of bytes written.
        If the count is less than len(s), it also returns an error explaining
        why the write is short.
    **/
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}