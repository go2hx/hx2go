package go.encoding;

/**
    Package base32 implements base32 encoding as specified by RFC 4648.
**/
@:go.Type({ name: "base32", instanceName: "base32.base32", imports: ["encoding/base32"] })
extern class Base32 {

    @:native("NoPadding") static var noPadding: go.Rune;
    @:native("StdPadding") static var stdPadding: go.Rune;

    /**
        HexEncoding is the “Extended Hex Alphabet” defined in RFC 4648.
        It is typically used in DNS.
    **/
    @:native("HexEncoding") static var hexEncoding: go.Pointer<go.encoding.base32.Encoding>;
    /**
        StdEncoding is the standard base32 encoding, as defined in RFC 4648.
    **/
    @:native("StdEncoding") static var stdEncoding: go.Pointer<go.encoding.base32.Encoding>;

    /**
        NewDecoder constructs a new base32 stream decoder.
    **/
    @:native("NewDecoder") static function newDecoder(enc: go.Pointer<go.encoding.base32.Encoding>, r: go.io.Reader): (go.io.Reader);
    /**
        NewEncoder returns a new base32 stream encoder. Data written to
        the returned writer will be encoded using enc and then written to w.
        Base32 encodings operate in 5-byte blocks; when finished
        writing, the caller must Close the returned encoder to flush any
        partially written blocks.
    **/
    @:native("NewEncoder") static function newEncoder(enc: go.Pointer<go.encoding.base32.Encoding>, w: go.io.Writer): (go.io.WriteCloser);
    /**
        NewEncoding returns a new padded Encoding defined by the given alphabet,
        which must be a 32-byte string that contains unique byte values and
        does not contain the padding character or CR / LF ('\r', '\n').
        The alphabet is treated as a sequence of byte values
        without any special treatment for multi-byte UTF-8.
        The resulting Encoding uses the default padding character ('='),
        which may be changed or disabled via [Encoding.WithPadding].
    **/
    @:native("NewEncoding") static function newEncoding(encoder: String): (go.Pointer<go.encoding.base32.Encoding>);

}