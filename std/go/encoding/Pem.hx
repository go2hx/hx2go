package go.encoding;

/**
    Package pem implements the PEM data encoding, which originated in Privacy
    Enhanced Mail. The most common use of PEM encoding today is in TLS keys and
    certificates. See RFC 1421.
**/
@:go.Type({ name: "pem", instanceName: "pem.pem", imports: ["encoding/pem"] })
extern class Pem {

    /**
        Decode will find the next PEM formatted block (certificate, private key
        etc) in the input. It returns that block and the remainder of the input. If
        no PEM data is found, p is nil and the whole of the input is returned in
        rest. Blocks must start at the beginning of a line and end at the end of a line.
    **/
    @:go.Tuple("p", "rest") @:native("Decode") static function decode(data: go.Slice<go.Byte>): (go.Tuple<{ p: go.Pointer<go.encoding.pem.Block>, rest: go.Slice<go.Byte> }>);
    /**
        Encode writes the PEM encoding of b to out.
    **/
    @:native("Encode") static function encode(out: go.io.Writer, b: go.Pointer<go.encoding.pem.Block>): (go.Error);
    /**
        EncodeToMemory returns the PEM encoding of b.
        
        If b has invalid headers and cannot be encoded,
        EncodeToMemory returns nil. If it is important to
        report details about this error case, use [Encode] instead.
    **/
    @:native("EncodeToMemory") static function encodeToMemory(b: go.Pointer<go.encoding.pem.Block>): (go.Slice<go.Byte>);

}