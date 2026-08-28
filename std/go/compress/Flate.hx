package go.compress;

/**
    Package flate implements the DEFLATE compressed data format, described in
    RFC 1951.  The [compress/gzip] and [compress/zlib] packages implement access
    to DEFLATE-based file formats.
**/
@:go.Type({ name: "flate", instanceName: "flate.flate", imports: ["compress/flate"] })
extern class Flate {

    @:native("BestCompression") static var bestCompression: go.GoInt;
    @:native("BestSpeed") static var bestSpeed: go.GoInt;
    @:native("DefaultCompression") static var defaultCompression: go.GoInt;
    @:native("HuffmanOnly") static var huffmanOnly: go.GoInt;
    @:native("NoCompression") static var noCompression: go.GoInt;

    /**
        NewReader returns a new ReadCloser that can be used
        to read the uncompressed version of r.
        If r does not also implement [io.ByteReader],
        the decompressor may read more data than necessary from r.
        The reader returns [io.EOF] after the final block in the DEFLATE stream has
        been encountered. Any trailing data after the final block is ignored.
        
        The [io.ReadCloser] returned by NewReader also implements [Resetter].
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.io.ReadCloser);
    /**
        NewReaderDict is like [NewReader] but initializes the reader
        with a preset dictionary. The returned reader behaves as if
        the uncompressed data stream started with the given dictionary,
        which has already been read. NewReaderDict is typically used
        to read data compressed by [NewWriterDict].
        
        The ReadCloser returned by NewReaderDict also implements [Resetter].
    **/
    @:native("NewReaderDict") static function newReaderDict(r: go.io.Reader, dict: go.Slice<go.Byte>): (go.io.ReadCloser);
    /**
        NewWriter returns a new [Writer] compressing data at the given level.
        Following zlib, levels range from 1 ([BestSpeed]) to 9 ([BestCompression]);
        higher levels typically run slower but compress more. Level 0
        ([NoCompression]) does not attempt any compression; it only adds the
        necessary DEFLATE framing.
        Level -1 ([DefaultCompression]) uses the default compression level.
        Level -2 ([HuffmanOnly]) will use Huffman compression only, giving
        a very fast compression for all types of input, but sacrificing considerable
        compression efficiency.
        
        If level is in the range [-2, 9] then the error returned will be nil.
        Otherwise the error returned will be non-nil.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer, level: go.GoInt): (go.Result<go.Pointer<go.compress.flate.Writer>>);
    /**
        NewWriterDict is like [NewWriter] but initializes the new
        [Writer] with a preset dictionary. The returned [Writer] behaves
        as if the dictionary had been written to it without producing
        any compressed output. The compressed data written to w
        can only be decompressed by a reader initialized with the
        same dictionary (see [NewReaderDict]).
    **/
    @:native("NewWriterDict") static function newWriterDict(w: go.io.Writer, level: go.GoInt, dict: go.Slice<go.Byte>): (go.Result<go.Pointer<go.compress.flate.Writer>>);

}