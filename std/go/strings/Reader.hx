package go.strings;

/**
    A Reader implements the [io.Reader], [io.ReaderAt], [io.ByteReader], [io.ByteScanner],
    [io.RuneReader], [io.RuneScanner], [io.Seeker], and [io.WriterTo] interfaces by reading
    from a string.
    The zero value for Reader operates like a Reader of an empty string.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "strings.Reader", imports: ["strings"] })
extern class Reader {

    /**
        Len returns the number of bytes of the unread portion of the
        string.
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
        Reset resets the [Reader] to be reading from s.
    **/
    @:native("Reset") function reset(s: String): Void;
    /**
        Seek implements the [io.Seeker] interface.
    **/
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    /**
        Size returns the original length of the underlying string.
        Size is the number of bytes available for reading via [Reader.ReadAt].
        The returned value is always the same and is not affected by calls
        to any other method.
    **/
    @:native("Size") function size(): (go.Int64);
    /**
        UnreadByte implements the [io.ByteScanner] interface.
    **/
    @:native("UnreadByte") function unreadByte(): (go.Error);
    /**
        UnreadRune implements the [io.RuneScanner] interface.
    **/
    @:native("UnreadRune") function unreadRune(): (go.Error);
    /**
        WriteTo implements the [io.WriterTo] interface.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}