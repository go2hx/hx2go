package go.encoding.base32;

/**
    An Encoding is a radix 32 encoding/decoding scheme, defined by a
    32-character alphabet. The most common is the "base32" encoding
    introduced for SASL GSSAPI and standardized in RFC 4648.
    The alternate "base32hex" encoding is used in DNSSEC.
**/
@:structInit
@:go.Type({ name: "Encoding", instanceName: "base32.Encoding", imports: ["encoding/base32"] })
extern class Encoding {

    /**
        AppendDecode appends the base32 decoded src to dst
        and returns the extended buffer.
        If the input is malformed, it returns the partially decoded src and an error.
        New line characters (\r and \n) are ignored.
    **/
    @:native("AppendDecode") function appendDecode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        AppendEncode appends the base32 encoded src to dst
        and returns the extended buffer.
    **/
    @:native("AppendEncode") function appendEncode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Decode decodes src using the encoding enc. It writes at most
        [Encoding.DecodedLen](len(src)) bytes to dst and returns the number of bytes
        written. The caller must ensure that dst is large enough to hold all
        the decoded data. If src contains invalid base32 data, it will return the
        number of bytes successfully written and [CorruptInputError].
        Newline characters (\r and \n) are ignored.
    **/
    @:native("Decode") function decode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        DecodeString returns the bytes represented by the base32 string s.
        If the input is malformed, it returns the partially decoded data and
        [CorruptInputError]. New line characters (\r and \n) are ignored.
    **/
    @:native("DecodeString") function decodeString(s: String): (go.Result<go.Slice<go.Byte>>);
    /**
        DecodedLen returns the maximum length in bytes of the decoded data
        corresponding to n bytes of base32-encoded data.
    **/
    @:native("DecodedLen") function decodedLen(n: go.GoInt): (go.GoInt);
    /**
        Encode encodes src using the encoding enc,
        writing [Encoding.EncodedLen](len(src)) bytes to dst.
        
        The encoding pads the output to a multiple of 8 bytes,
        so Encode is not appropriate for use on individual blocks
        of a large data stream. Use [NewEncoder] instead.
    **/
    @:native("Encode") function encode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    /**
        EncodeToString returns the base32 encoding of src.
    **/
    @:native("EncodeToString") function encodeToString(src: go.Slice<go.Byte>): (String);
    /**
        EncodedLen returns the length in bytes of the base32 encoding
        of an input buffer of length n.
    **/
    @:native("EncodedLen") function encodedLen(n: go.GoInt): (go.GoInt);
    /**
        WithPadding creates a new encoding identical to enc except
        with a specified padding character, or NoPadding to disable padding.
        The padding character must not be '\r' or '\n',
        must not be contained in the encoding's alphabet,
        must not be negative, and must be a rune equal or below '\xff'.
        Padding characters above '\x7f' are encoded as their exact byte value
        rather than using the UTF-8 representation of the codepoint.
    **/
    @:native("WithPadding") function withPadding(padding: go.Rune): (go.Pointer<go.encoding.base32.Encoding>);

}