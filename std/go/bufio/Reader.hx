package go.bufio;

/**
    Reader implements buffering for an io.Reader object.
    A new Reader is created by calling [NewReader] or [NewReaderSize];
    alternatively the zero value of a Reader may be used after calling [Reset]
    on it.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "bufio.Reader", imports: ["bufio"] })
extern class Reader {

    /**
        Buffered returns the number of bytes that can be read from the current buffer.
    **/
    @:native("Buffered") function buffered(): (go.GoInt);
    /**
        Discard skips the next n bytes, returning the number of bytes discarded.
        
        If Discard skips fewer than n bytes, it also returns an error.
        If 0 <= n <= b.Buffered(), Discard is guaranteed to succeed without
        reading from the underlying io.Reader.
    **/
    @:native("Discard") function discard(n: go.GoInt): (go.Result<go.GoInt>);
    /**
        Peek returns the next n bytes without advancing the reader. The bytes stop
        being valid at the next read call. If necessary, Peek will read more bytes
        into the buffer in order to make n bytes available. If Peek returns fewer
        than n bytes, it also returns an error explaining why the read is short.
        The error is [ErrBufferFull] if n is larger than b's buffer size.
        
        Calling Peek prevents a [Reader.UnreadByte] or [Reader.UnreadRune] call from succeeding
        until the next read operation.
    **/
    @:native("Peek") function peek(n: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    /**
        Read reads data into p.
        It returns the number of bytes read into p.
        The bytes are taken from at most one Read on the underlying [Reader],
        hence n may be less than len(p).
        To read exactly len(p) bytes, use io.ReadFull(b, p).
        If the underlying [Reader] can return a non-zero count with io.EOF,
        then this Read method can do so as well; see the [io.Reader] docs.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        ReadByte reads and returns a single byte.
        If no byte is available, returns an error.
    **/
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    /**
        ReadBytes reads until the first occurrence of delim in the input,
        returning a slice containing the data up to and including the delimiter.
        If ReadBytes encounters an error before finding a delimiter,
        it returns the data read before the error and the error itself (often io.EOF).
        ReadBytes returns err != nil if and only if the returned data does not end in
        delim.
        For simple uses, a Scanner may be more convenient.
    **/
    @:native("ReadBytes") function readBytes(delim: go.Byte): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadLine is a low-level line-reading primitive. Most callers should use
        [Reader.ReadBytes]('\n') or [Reader.ReadString]('\n') instead or use a [Scanner].
        
        ReadLine tries to return a single line, not including the end-of-line bytes.
        If the line was too long for the buffer then isPrefix is set and the
        beginning of the line is returned. The rest of the line will be returned
        from future calls. isPrefix will be false when returning the last fragment
        of the line. The returned buffer is only valid until the next call to
        ReadLine. ReadLine either returns a non-nil line or it returns an error,
        never both.
        
        The text returned from ReadLine does not include the line end ("\r\n" or "\n").
        No indication or error is given if the input ends without a final line end.
        Calling [Reader.UnreadByte] after ReadLine will always unread the last byte read
        (possibly a character belonging to the line end) even if that byte is not
        part of the line returned by ReadLine.
    **/
    @:go.Tuple("line", "isPrefix", "err") @:native("ReadLine") function readLine(): (go.Tuple<{ line: go.Slice<go.Byte>, isPrefix: Bool, err: go.Error }>);
    /**
        ReadRune reads a single UTF-8 encoded Unicode character and returns the
        rune and its size in bytes. If the encoded rune is invalid, it consumes one byte
        and returns unicode.ReplacementChar (U+FFFD) with a size of 1.
    **/
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);
    /**
        ReadSlice reads until the first occurrence of delim in the input,
        returning a slice pointing at the bytes in the buffer.
        The bytes stop being valid at the next read.
        If ReadSlice encounters an error before finding a delimiter,
        it returns all the data in the buffer and the error itself (often io.EOF).
        ReadSlice fails with error [ErrBufferFull] if the buffer fills without a delim.
        Because the data returned from ReadSlice will be overwritten
        by the next I/O operation, most clients should use
        [Reader.ReadBytes] or ReadString instead.
        ReadSlice returns err != nil if and only if line does not end in delim.
    **/
    @:native("ReadSlice") function readSlice(delim: go.Byte): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadString reads until the first occurrence of delim in the input,
        returning a string containing the data up to and including the delimiter.
        If ReadString encounters an error before finding a delimiter,
        it returns the data read before the error and the error itself (often io.EOF).
        ReadString returns err != nil if and only if the returned data does not end in
        delim.
        For simple uses, a Scanner may be more convenient.
    **/
    @:native("ReadString") function readString(delim: go.Byte): (go.Result<String>);
    /**
        Reset discards any buffered data, resets all state, and switches
        the buffered reader to read from r.
        Calling Reset on the zero value of [Reader] initializes the internal buffer
        to the default size.
        Calling b.Reset(b) (that is, resetting a [Reader] to itself) does nothing.
    **/
    @:native("Reset") function reset(r: go.io.Reader): Void;
    /**
        Size returns the size of the underlying buffer in bytes.
    **/
    @:native("Size") function size(): (go.GoInt);
    /**
        UnreadByte unreads the last byte. Only the most recently read byte can be unread.
        
        UnreadByte returns an error if the most recent method called on the
        [Reader] was not a read operation. Notably, [Reader.Peek], [Reader.Discard], and [Reader.WriteTo] are not
        considered read operations.
    **/
    @:native("UnreadByte") function unreadByte(): (go.Error);
    /**
        UnreadRune unreads the last rune. If the most recent method called on
        the [Reader] was not a [Reader.ReadRune], [Reader.UnreadRune] returns an error. (In this
        regard it is stricter than [Reader.UnreadByte], which will unread the last byte
        from any read operation.)
    **/
    @:native("UnreadRune") function unreadRune(): (go.Error);
    /**
        WriteTo implements io.WriterTo.
        This may make multiple calls to the [Reader.Read] method of the underlying [Reader].
        If the underlying reader supports the [Reader.WriteTo] method,
        this calls the underlying [Reader.WriteTo] without buffering.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}