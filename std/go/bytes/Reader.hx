package go.bytes;

/**
    A Reader implements the [io.Reader], [io.ReaderAt], [io.WriterTo], [io.Seeker],
    [io.ByteScanner], and [io.RuneScanner] interfaces by reading from
    a byte slice.
    Unlike a [Buffer], a Reader is read-only and supports seeking.
    The zero value for Reader operates like a Reader of an empty slice.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "bytes.Reader", imports: ["bytes"] })
extern class Reader {

    /**
        Len returns the number of bytes of the unread portion of the
        slice.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Read implements the [io.Reader] interface.
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        ReadAt implements the [io.ReaderAt] interface.
    **/
    @:native("ReadAt") function readAt(b: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    /**
        ReadByte implements the [io.ByteReader] interface.
    **/
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    /**
        ReadRune implements the [io.RuneReader] interface.
    **/
    @:go.Tuple("ch", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ ch: go.Rune, size: go.GoInt, err: go.Error }>);
    /**
        Reset resets the [Reader] to be reading from b.
    **/
    @:native("Reset") function reset(b: go.Slice<go.Byte>): Void;
    /**
        Seek implements the [io.Seeker] interface.
    **/
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    /**
        Size returns the original length of the underlying byte slice.
        Size is the number of bytes available for reading via [Reader.ReadAt].
        The result is unaffected by any method calls except [Reader.Reset].
    **/
    @:native("Size") function size(): (go.Int64);
    /**
        UnreadByte complements [Reader.ReadByte] in implementing the [io.ByteScanner] interface.
    **/
    @:native("UnreadByte") function unreadByte(): (go.Error);
    /**
        UnreadRune complements [Reader.ReadRune] in implementing the [io.RuneScanner] interface.
    **/
    @:native("UnreadRune") function unreadRune(): (go.Error);
    /**
        WriteTo implements the [io.WriterTo] interface.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}