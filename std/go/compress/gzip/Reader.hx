package go.compress.gzip;

/**
    A Reader is an [io.Reader] that can be read to retrieve
    uncompressed data from a gzip-format compressed file.
    
    In general, a gzip file can be a concatenation of gzip files,
    each with its own header. Reads from the Reader
    return the concatenation of the uncompressed data of each.
    Only the first header is recorded in the Reader fields.
    
    Gzip files store a length and checksum of the uncompressed data.
    The Reader will return an [ErrChecksum] when [Reader.Read]
    reaches the end of the uncompressed data if it does not
    have the expected length or checksum. Clients should treat data
    returned by [Reader.Read] as tentative until they receive the [io.EOF]
    marking the end of the data.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "gzip.Reader", imports: ["compress/gzip"] })
extern class Reader {

    @:native("Header") var header: go.compress.gzip.Header;
    @:native("Comment") var comment: String;
    @:native("Extra") var extra: go.Slice<go.Byte>;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("Name") var name: String;
    @:native("OS") var OS: go.Byte;

    function new(header: go.compress.gzip.Header);

    /**
        Close closes the [Reader]. It does not close the underlying reader.
        In order for the GZIP checksum to be verified, the reader must be
        fully consumed until the [io.EOF].
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Multistream controls whether the reader supports multistream files.
        
        If enabled (the default), the [Reader] expects the input to be a sequence
        of individually gzipped data streams, each with its own header and
        trailer, ending at EOF. The effect is that the concatenation of a sequence
        of gzipped files is treated as equivalent to the gzip of the concatenation
        of the sequence. This is standard behavior for gzip readers.
        
        Calling Multistream(false) disables this behavior; disabling the behavior
        can be useful when reading file formats that distinguish individual gzip
        data streams or mix gzip data streams with other data streams.
        In this mode, when the [Reader] reaches the end of the data stream,
        [Reader.Read] returns [io.EOF]. The underlying reader must implement [io.ByteReader]
        in order to be left positioned just after the gzip stream.
        To start the next stream, call z.Reset(r) followed by z.Multistream(false).
        If there is no next stream, z.Reset(r) will return [io.EOF].
    **/
    @:native("Multistream") function multistream(ok: Bool): Void;
    /**
        Read implements [io.Reader], reading uncompressed bytes from its underlying reader.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        Reset discards the [Reader] z's state and makes it equivalent to the
        result of its original state from [NewReader], but reading from r instead.
        This permits reusing a [Reader] rather than allocating a new one.
    **/
    @:native("Reset") function reset(r: go.io.Reader): (go.Error);

}