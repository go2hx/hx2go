package go.encoding;

/**
    Package ascii85 implements the ascii85 data encoding
    as used in the btoa tool and Adobe's PostScript and PDF document formats.
**/
@:go.Type({ name: "ascii85", instanceName: "ascii85.ascii85", imports: ["encoding/ascii85"] })
extern class Ascii85 {

    /**
        Decode decodes src into dst, returning both the number
        of bytes written to dst and the number consumed from src.
        If src contains invalid ascii85 data, Decode will return the
        number of bytes successfully written and a [CorruptInputError].
        Decode ignores space and control characters in src.
        Often, ascii85-encoded data is wrapped in <~ and ~> symbols.
        Decode expects these to have been stripped by the caller.
        
        If flush is true, Decode assumes that src represents the
        end of the input stream and processes it completely rather
        than wait for the completion of another 32-bit block.
        
        [NewDecoder] wraps an [io.Reader] interface around Decode.
    **/
    @:go.Tuple("ndst", "nsrc", "err") @:native("Decode") static function decode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>, flush: Bool): (go.Tuple<{ ndst: go.GoInt, nsrc: go.GoInt, err: go.Error }>);
    /**
        Encode encodes src into at most [MaxEncodedLen](len(src))
        bytes of dst, returning the actual number of bytes written.
        
        The encoding handles 4-byte chunks, using a special encoding
        for the last fragment, so Encode is not appropriate for use on
        individual blocks of a large data stream. Use [NewEncoder] instead.
        
        Often, ascii85-encoded data is wrapped in <~ and ~> symbols.
        Encode does not add these.
    **/
    @:native("Encode") static function encode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.GoInt);
    /**
        MaxEncodedLen returns the maximum length of an encoding of n source bytes.
    **/
    @:native("MaxEncodedLen") static function maxEncodedLen(n: go.GoInt): (go.GoInt);
    /**
        NewDecoder constructs a new ascii85 stream decoder.
    **/
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): (go.io.Reader);
    /**
        NewEncoder returns a new ascii85 stream encoder. Data written to
        the returned writer will be encoded and then written to w.
        Ascii85 encodings operate in 32-bit blocks; when finished
        writing, the caller must Close the returned encoder to flush any
        trailing partial block.
    **/
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): (go.io.WriteCloser);

}