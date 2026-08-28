package go.compress;

/**
    Package gzip implements reading and writing of gzip format compressed files,
    as specified in RFC 1952.
**/
@:go.Type({ name: "gzip", instanceName: "gzip.gzip", imports: ["compress/gzip"] })
extern class Gzip {

    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/gzip] does not also have to import [compress/flate].
    **/
    @:native("BestCompression") static var bestCompression: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/gzip] does not also have to import [compress/flate].
    **/
    @:native("BestSpeed") static var bestSpeed: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/gzip] does not also have to import [compress/flate].
    **/
    @:native("DefaultCompression") static var defaultCompression: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/gzip] does not also have to import [compress/flate].
    **/
    @:native("HuffmanOnly") static var huffmanOnly: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/gzip] does not also have to import [compress/flate].
    **/
    @:native("NoCompression") static var noCompression: go.GoInt;

    /**
        NewReader creates a new [Reader] reading the given reader.
        If r does not also implement [io.ByteReader],
        the decompressor may read more data than necessary from r.
        
        It is the caller's responsibility to call [Reader.Close] when done.
        
        The Reader.[Header] fields will be valid in the [Reader] returned.
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Result<go.Pointer<go.compress.gzip.Reader>>);
    /**
        NewWriter returns a new [Writer].
        Writes to the returned writer are compressed and written to w.
        
        It is the caller's responsibility to call Close on the [Writer] when done.
        Writes may be buffered and not flushed until Close.
        
        Callers that wish to set the fields in Writer.[Header] must do so before
        the first call to Write, Flush, or Close.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.compress.gzip.Writer>);
    /**
        NewWriterLevel is like [NewWriter] but specifies the compression level instead
        of assuming [DefaultCompression].
        
        The compression level can be [DefaultCompression], [NoCompression], [HuffmanOnly]
        or any integer value between [BestSpeed] and [BestCompression] inclusive.
        The error returned will be nil if the level is valid.
    **/
    @:native("NewWriterLevel") static function newWriterLevel(w: go.io.Writer, level: go.GoInt): (go.Result<go.Pointer<go.compress.gzip.Writer>>);

}