package go.encoding.asn1;

/**
    BitString is the structure to use when you want an ASN.1 BIT STRING type. A
    bit string is padded up to the nearest byte in memory and the number of
    valid bits is recorded. Padding bits will be zero.
**/
@:structInit
@:go.Type({ name: "BitString", instanceName: "asn1.BitString", imports: ["encoding/asn1"] })
extern class BitString {

    @:native("Bytes") var bytes: go.Slice<go.Byte>;
    @:native("BitLength") var bitLength: go.GoInt;

    function new(bytes: go.Slice<go.Byte>=null, bitLength: go.GoInt=0);

    /**
        At returns the bit at the given index. If the index is out of range it
        returns 0.
    **/
    @:native("At") function at(i: go.GoInt): (go.GoInt);
    /**
        RightAlign returns a slice where the padding bits are at the beginning. The
        slice may share memory with the BitString.
    **/
    @:native("RightAlign") function rightAlign(): (go.Slice<go.Byte>);

}