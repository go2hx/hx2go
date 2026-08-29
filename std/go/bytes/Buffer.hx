package go.bytes;

/**
    A Buffer is a variable-sized buffer of bytes with [Buffer.Read] and [Buffer.Write] methods.
    The zero value for Buffer is an empty buffer ready to use.
**/
@:structInit
@:go.Type({ name: "Buffer", instanceName: "bytes.Buffer", imports: ["bytes"] })
extern class Buffer {

    /**
        Available returns how many bytes are unused in the buffer.
    **/
    @:native("Available") function available(): (go.GoInt);
    /**
        AvailableBuffer returns an empty buffer with b.Available() capacity.
        This buffer is intended to be appended to and
        passed to an immediately succeeding [Buffer.Write] call.
        The buffer is only valid until the next write operation on b.
    **/
    @:native("AvailableBuffer") function availableBuffer(): (go.Slice<go.Byte>);
    /**
        Bytes returns a slice of length b.Len() holding the unread portion of the buffer.
        The slice is valid for use only until the next buffer modification (that is,
        only until the next call to a method like [Buffer.Read], [Buffer.Write], [Buffer.Reset], or [Buffer.Truncate]).
        The slice aliases the buffer content at least until the next buffer modification,
        so immediate changes to the slice will affect the result of future reads.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Cap returns the capacity of the buffer's underlying byte slice, that is, the
        total space allocated for the buffer's data.
    **/
    @:native("Cap") function cap(): (go.GoInt);
    /**
        Grow grows the buffer's capacity, if necessary, to guarantee space for
        another n bytes. After Grow(n), at least n bytes can be written to the
        buffer without another allocation.
        If n is negative, Grow will panic.
        If the buffer can't grow it will panic with [ErrTooLarge].
    **/
    @:native("Grow") function grow(n: go.GoInt): Void;
    /**
        Len returns the number of bytes of the unread portion of the buffer;
        b.Len() == len(b.Bytes()).
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Next returns a slice containing the next n bytes from the buffer,
        advancing the buffer as if the bytes had been returned by [Buffer.Read].
        If there are fewer than n bytes in the buffer, Next returns the entire buffer.
        The slice is only valid until the next call to a read or write method.
    **/
    @:native("Next") function next(n: go.GoInt): (go.Slice<go.Byte>);
    /**
        Peek returns the next n bytes without advancing the buffer.
        If Peek returns fewer than n bytes, it also returns [io.EOF].
        The slice is only valid until the next call to a read or write method.
        The slice aliases the buffer content at least until the next buffer modification,
        so immediate changes to the slice will affect the result of future reads.
    **/
    @:native("Peek") function peek(n: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    /**
        Read reads the next len(p) bytes from the buffer or until the buffer
        is drained. The return value n is the number of bytes read. If the
        buffer has no data to return, err is [io.EOF] (unless len(p) is zero);
        otherwise it is nil.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        ReadByte reads and returns the next byte from the buffer.
        If no byte is available, it returns error [io.EOF].
    **/
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    /**
        ReadBytes reads until the first occurrence of delim in the input,
        returning a slice containing the data up to and including the delimiter.
        If ReadBytes encounters an error before finding a delimiter,
        it returns the data read before the error and the error itself (often [io.EOF]).
        ReadBytes returns err != nil if and only if the returned data does not end in
        delim.
    **/
    @:native("ReadBytes") function readBytes(delim: go.Byte): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadFrom reads data from r until EOF and appends it to the buffer, growing
        the buffer as needed. The return value n is the number of bytes read. Any
        error except io.EOF encountered during the read is also returned. If the
        buffer becomes too large, ReadFrom will panic with [ErrTooLarge].
    **/
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    /**
        ReadRune reads and returns the next UTF-8-encoded
        Unicode code point from the buffer.
        If no bytes are available, the error returned is io.EOF.
        If the bytes are an erroneous UTF-8 encoding, it
        consumes one byte and returns U+FFFD, 1.
    **/
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);
    /**
        ReadString reads until the first occurrence of delim in the input,
        returning a string containing the data up to and including the delimiter.
        If ReadString encounters an error before finding a delimiter,
        it returns the data read before the error and the error itself (often [io.EOF]).
        ReadString returns err != nil if and only if the returned data does not end
        in delim.
    **/
    @:native("ReadString") function readString(delim: go.Byte): (go.Result<String>);
    /**
        Reset resets the buffer to be empty,
        but it retains the underlying storage for use by future writes.
        Reset is the same as [Buffer.Truncate](0).
    **/
    @:native("Reset") function reset(): Void;
    /**
        String returns the contents of the unread portion of the buffer
        as a string. If the [Buffer] is a nil pointer, it returns "<nil>".
        
        To build strings more efficiently, see the [strings.Builder] type.
    **/
    @:native("String") function string(): (String);
    /**
        Truncate discards all but the first n unread bytes from the buffer
        but continues to use the same allocated storage.
        It panics if n is negative or greater than the length of the buffer.
    **/
    @:native("Truncate") function truncate(n: go.GoInt): Void;
    /**
        UnreadByte unreads the last byte returned by the most recent successful
        read operation that read at least one byte. If a write has happened since
        the last read, if the last read returned an error, or if the read read zero
        bytes, UnreadByte returns an error.
    **/
    @:native("UnreadByte") function unreadByte(): (go.Error);
    /**
        UnreadRune unreads the last rune returned by [Buffer.ReadRune].
        If the most recent read or write operation on the buffer was
        not a successful [Buffer.ReadRune], UnreadRune returns an error.  (In this regard
        it is stricter than [Buffer.UnreadByte], which will unread the last byte
        from any read operation.)
    **/
    @:native("UnreadRune") function unreadRune(): (go.Error);
    /**
        Write appends the contents of p to the buffer, growing the buffer as
        needed. The return value n is the length of p; err is always nil. If the
        buffer becomes too large, Write will panic with [ErrTooLarge].
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteByte appends the byte c to the buffer, growing the buffer as needed.
        The returned error is always nil, but is included to match [bufio.Writer]'s
        WriteByte. If the buffer becomes too large, WriteByte will panic with
        [ErrTooLarge].
    **/
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    /**
        WriteRune appends the UTF-8 encoding of Unicode code point r to the
        buffer, returning its length and an error, which is always nil but is
        included to match [bufio.Writer]'s WriteRune. The buffer is grown as needed;
        if it becomes too large, WriteRune will panic with [ErrTooLarge].
    **/
    @:native("WriteRune") function writeRune(r: go.Rune): (go.Result<go.GoInt>);
    /**
        WriteString appends the contents of s to the buffer, growing the buffer as
        needed. The return value n is the length of s; err is always nil. If the
        buffer becomes too large, WriteString will panic with [ErrTooLarge].
    **/
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);
    /**
        WriteTo writes data to w until the buffer is drained or an error occurs.
        The return value n is the number of bytes written; it always fits into an
        int, but it is int64 to match the [io.WriterTo] interface. Any error
        encountered during the write is also returned.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}