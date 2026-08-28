package go.encoding;

/**
    Package base64 implements base64 encoding as specified by RFC 4648.
**/
@:go.Type({ name: "base64", instanceName: "base64.base64", imports: ["encoding/base64"] })
extern class Base64 {

    @:native("NoPadding") static var noPadding: go.Rune;
    @:native("StdPadding") static var stdPadding: go.Rune;

    /**
        RawStdEncoding is the standard raw, unpadded base64 encoding,
        as defined in RFC 4648 section 3.2.
        This is the same as [StdEncoding] but omits padding characters.
    **/
    @:native("RawStdEncoding") static var rawStdEncoding: go.Pointer<go.encoding.base64.Encoding>;
    /**
        RawURLEncoding is the unpadded alternate base64 encoding defined in RFC 4648.
        It is typically used in URLs and file names.
        This is the same as [URLEncoding] but omits padding characters.
    **/
    @:native("RawURLEncoding") static var rawURLEncoding: go.Pointer<go.encoding.base64.Encoding>;
    /**
        StdEncoding is the standard base64 encoding, as defined in RFC 4648.
    **/
    @:native("StdEncoding") static var stdEncoding: go.Pointer<go.encoding.base64.Encoding>;
    /**
        URLEncoding is the alternate base64 encoding defined in RFC 4648.
        It is typically used in URLs and file names.
    **/
    @:native("URLEncoding") static var uRLEncoding: go.Pointer<go.encoding.base64.Encoding>;

    /**
        NewDecoder constructs a new base64 stream decoder.
    **/
    @:native("NewDecoder") static function newDecoder(enc: go.Pointer<go.encoding.base64.Encoding>, r: go.io.Reader): (go.io.Reader);
    /**
        NewEncoder returns a new base64 stream encoder. Data written to
        the returned writer will be encoded using enc and then written to w.
        Base64 encodings operate in 4-byte blocks; when finished
        writing, the caller must Close the returned encoder to flush any
        partially written blocks.
    **/
    @:native("NewEncoder") static function newEncoder(enc: go.Pointer<go.encoding.base64.Encoding>, w: go.io.Writer): (go.io.WriteCloser);
    /**
        NewEncoding returns a new padded Encoding defined by the given alphabet,
        which must be a 64-byte string that contains unique byte values and
        does not contain the padding character or CR / LF ('\r', '\n').
        The alphabet is treated as a sequence of byte values
        without any special treatment for multi-byte UTF-8.
        The resulting Encoding uses the default padding character ('='),
        which may be changed or disabled via [Encoding.WithPadding].
    **/
    @:native("NewEncoding") static function newEncoding(encoder: String): (go.Pointer<go.encoding.base64.Encoding>);

}