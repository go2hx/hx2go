package go.encoding.asn1;

@:structInit
@:go.Type({ name: "BitString", instanceName: "asn1.BitString", imports: ["encoding/asn1"] })
extern class BitString {

    @:native("Bytes") var bytes: go.Slice<go.Byte>;
    @:native("BitLength") var bitLength: go.GoInt;

function new(bytes: go.Slice<go.Byte>, bitLength: go.GoInt);

    @:native("At") function at(i: go.GoInt): go.GoInt;
    @:native("RightAlign") function rightAlign(): go.Slice<go.Byte>;

}