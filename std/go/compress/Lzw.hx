package go.compress;

/**
    Package lzw implements the Lempel-Ziv-Welch compressed data format,
    described in T. A. Welch, “A Technique for High-Performance Data
    Compression”, Computer, 17(6) (June 1984), pp 8-19.
    
    In particular, it implements LZW as used by the GIF and PDF file
    formats, which means variable-width codes up to 12 bits and the first
    two non-literal codes are a clear code and an EOF code.
    
    The TIFF file format uses a similar but incompatible version of the LZW
    algorithm. See the [golang.org/x/image/tiff/lzw] package for an
    implementation.
**/
@:go.Type({ name: "lzw", instanceName: "lzw.lzw", imports: ["compress/lzw"] })
extern class Lzw {

    @:native("LSB") static var LSB: go.compress.lzw.Order;
    @:native("MSB") static var MSB: go.compress.lzw.Order;

    /**
        NewReader creates a new [io.ReadCloser].
        Reads from the returned [io.ReadCloser] read and decompress data from r.
        If r does not also implement [io.ByteReader],
        the decompressor may read more data than necessary from r.
        It is the caller's responsibility to call Close on the ReadCloser when
        finished reading.
        The number of bits to use for literal codes, litWidth, must be in the
        range [2,8] and is typically 8. It must equal the litWidth
        used during compression.
        
        It is guaranteed that the underlying type of the returned [io.ReadCloser]
        is a *[Reader].
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader, order: go.compress.lzw.Order, litWidth: go.GoInt): (go.io.ReadCloser);
    /**
        NewWriter creates a new [io.WriteCloser].
        Writes to the returned [io.WriteCloser] are compressed and written to w.
        It is the caller's responsibility to call Close on the WriteCloser when
        finished writing.
        The number of bits to use for literal codes, litWidth, must be in the
        range [2,8] and is typically 8. Input bytes must be less than 1<<litWidth.
        
        It is guaranteed that the underlying type of the returned [io.WriteCloser]
        is a *[Writer].
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer, order: go.compress.lzw.Order, litWidth: go.GoInt): (go.io.WriteCloser);

}