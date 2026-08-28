package go.compress;

/**
    Package zlib implements reading and writing of zlib format compressed data,
    as specified in RFC 1950.
    
    The implementation provides filters that uncompress during reading
    and compress during writing.  For example, to write compressed data
    to a buffer:
    
    	var b bytes.Buffer
    	w := zlib.NewWriter(&b)
    	w.Write([]byte("hello, world\n"))
    	w.Close()
    
    and to read that data back:
    
    	r, err := zlib.NewReader(&b)
    	io.Copy(os.Stdout, r)
    	r.Close()
**/
@:go.Type({ name: "zlib", instanceName: "zlib.zlib", imports: ["compress/zlib"] })
extern class Zlib {

    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/zlib] does not also have to import [compress/flate].
    **/
    @:native("BestCompression") static var bestCompression: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/zlib] does not also have to import [compress/flate].
    **/
    @:native("BestSpeed") static var bestSpeed: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/zlib] does not also have to import [compress/flate].
    **/
    @:native("DefaultCompression") static var defaultCompression: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/zlib] does not also have to import [compress/flate].
    **/
    @:native("HuffmanOnly") static var huffmanOnly: go.GoInt;
    /**
        These constants are copied from the [flate] package, so that code that imports
        [compress/zlib] does not also have to import [compress/flate].
    **/
    @:native("NoCompression") static var noCompression: go.GoInt;

    /**
        NewReader creates a new ReadCloser.
        Reads from the returned ReadCloser read and decompress data from r.
        If r does not implement [io.ByteReader], the decompressor may read more
        data than necessary from r.
        It is the caller's responsibility to call Close on the ReadCloser when done.
        
        The [io.ReadCloser] returned by NewReader also implements [Resetter].
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Result<go.io.ReadCloser>);
    /**
        NewReaderDict is like [NewReader] but uses a preset dictionary.
        NewReaderDict ignores the dictionary if the compressed data does not refer to it.
        If the compressed data refers to a different dictionary, NewReaderDict returns [ErrDictionary].
        
        The ReadCloser returned by NewReaderDict also implements [Resetter].
    **/
    @:native("NewReaderDict") static function newReaderDict(r: go.io.Reader, dict: go.Slice<go.Byte>): (go.Result<go.io.ReadCloser>);
    /**
        NewWriter creates a new [Writer].
        Writes to the returned Writer are compressed and written to w.
        
        It is the caller's responsibility to call Close on the Writer when done.
        Writes may be buffered and not flushed until Close.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.compress.zlib.Writer>);
    /**
        NewWriterLevel is like [NewWriter] but specifies the compression level instead
        of assuming [DefaultCompression].
        
        The compression level can be [DefaultCompression], [NoCompression], [HuffmanOnly]
        or any integer value between [BestSpeed] and [BestCompression] inclusive.
        The error returned will be nil if the level is valid.
    **/
    @:native("NewWriterLevel") static function newWriterLevel(w: go.io.Writer, level: go.GoInt): (go.Result<go.Pointer<go.compress.zlib.Writer>>);
    /**
        NewWriterLevelDict is like [NewWriterLevel] but specifies a dictionary to
        compress with.
        
        The dictionary may be nil. If not, its contents should not be modified until
        the Writer is closed.
    **/
    @:native("NewWriterLevelDict") static function newWriterLevelDict(w: go.io.Writer, level: go.GoInt, dict: go.Slice<go.Byte>): (go.Result<go.Pointer<go.compress.zlib.Writer>>);

}