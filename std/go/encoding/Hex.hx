package go.encoding;

/**
    Package hex implements hexadecimal encoding and decoding.
**/
@:go.Type({ name: "hex", instanceName: "hex.hex", imports: ["encoding/hex"] })
extern class Hex {

    /**
        AppendDecode appends the hexadecimally decoded src to dst
        and returns the extended buffer.
        If the input is malformed, it returns the partially decoded src and an error.
    **/
    @:native("AppendDecode") static function appendDecode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        AppendEncode appends the hexadecimally encoded src to dst
        and returns the extended buffer.
    **/
    @:native("AppendEncode") static function appendEncode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Decode decodes src into [DecodedLen](len(src)) bytes,
        returning the actual number of bytes written to dst.
        
        Decode expects that src contains only hexadecimal
        characters and that src has even length.
        If the input is malformed, Decode returns the number
        of bytes decoded before the error.
    **/
    @:native("Decode") static function decode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        DecodeString returns the bytes represented by the hexadecimal string s.
        
        DecodeString expects that src contains only hexadecimal
        characters and that src has even length.
        If the input is malformed, DecodeString returns
        the bytes decoded before the error.
    **/
    @:native("DecodeString") static function decodeString(s: String): (go.Result<go.Slice<go.Byte>>);
    /**
        DecodedLen returns the length of a decoding of x source bytes.
        Specifically, it returns x / 2.
    **/
    @:native("DecodedLen") static function decodedLen(x: go.GoInt): (go.GoInt);
    /**
        Dump returns a string that contains a hex dump of the given data. The format
        of the hex dump matches the output of `hexdump -C` on the command line.
    **/
    @:native("Dump") static function dump(data: go.Slice<go.Byte>): (String);
    /**
        Dumper returns a [io.WriteCloser] that writes a hex dump of all written data to
        w. The format of the dump matches the output of `hexdump -C` on the command
        line.
    **/
    @:native("Dumper") static function dumper(w: go.io.Writer): (go.io.WriteCloser);
    /**
        Encode encodes src into [EncodedLen](len(src))
        bytes of dst. As a convenience, it returns the number
        of bytes written to dst, but this value is always [EncodedLen](len(src)).
        Encode implements hexadecimal encoding.
    **/
    @:native("Encode") static function encode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): (go.GoInt);
    /**
        EncodeToString returns the hexadecimal encoding of src.
    **/
    @:native("EncodeToString") static function encodeToString(src: go.Slice<go.Byte>): (String);
    /**
        EncodedLen returns the length of an encoding of n source bytes.
        Specifically, it returns n * 2.
    **/
    @:native("EncodedLen") static function encodedLen(n: go.GoInt): (go.GoInt);
    /**
        NewDecoder returns an [io.Reader] that decodes hexadecimal characters from r.
        NewDecoder expects that r contain only an even number of hexadecimal characters.
    **/
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): (go.io.Reader);
    /**
        NewEncoder returns an [io.Writer] that writes lowercase hexadecimal characters to w.
    **/
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): (go.io.Writer);

}