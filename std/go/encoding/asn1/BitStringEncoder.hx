package go.encoding.asn1;

@:structInit
@:go.Type({ name: "bitStringEncoder", instanceName: "asn1.bitStringEncoder", imports: ["encoding/asn1"] })
extern class BitStringEncoder {

    @:native("Bytes") var bytes: go.Slice<go.Byte>;
    @:native("BitLength") var bitLength: go.GoInt;

    function new(bytes: go.Slice<go.Byte>, bitLength: go.GoInt);

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}