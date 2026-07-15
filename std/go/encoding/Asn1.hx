package go.encoding;

@:go.Type({ name: "asn1", instanceName: "asn1.asn1", imports: ["encoding/asn1"] })
extern class Asn1 {

    @:native("ClassApplication") static var ClassApplication: go.GoInt;
    @:native("ClassContextSpecific") static var ClassContextSpecific: go.GoInt;
    @:native("ClassPrivate") static var ClassPrivate: go.GoInt;
    @:native("ClassUniversal") static var ClassUniversal: go.GoInt;
    @:native("TagBMPString") static var TagBMPString: go.GoInt;
    @:native("TagBitString") static var TagBitString: go.GoInt;
    @:native("TagBoolean") static var TagBoolean: go.GoInt;
    @:native("TagEnum") static var TagEnum: go.GoInt;
    @:native("TagGeneralString") static var TagGeneralString: go.GoInt;
    @:native("TagGeneralizedTime") static var TagGeneralizedTime: go.GoInt;
    @:native("TagIA5String") static var TagIA5String: go.GoInt;
    @:native("TagInteger") static var TagInteger: go.GoInt;
    @:native("TagNull") static var TagNull: go.GoInt;
    @:native("TagNumericString") static var TagNumericString: go.GoInt;
    @:native("TagOID") static var TagOID: go.GoInt;
    @:native("TagOctetString") static var TagOctetString: go.GoInt;
    @:native("TagPrintableString") static var TagPrintableString: go.GoInt;
    @:native("TagSequence") static var TagSequence: go.GoInt;
    @:native("TagSet") static var TagSet: go.GoInt;
    @:native("TagT61String") static var TagT61String: go.GoInt;
    @:native("TagUTCTime") static var TagUTCTime: go.GoInt;
    @:native("TagUTF8String") static var TagUTF8String: go.GoInt;

    @:native("NullBytes") static var NullBytes: go.Slice<go.Byte>;
    @:native("NullRawValue") static var NullRawValue: go.encoding.asn1.RawValue;

    @:native("Marshal") static function marshal(val: Dynamic): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalWithParams") static function marshalWithParams(val: Dynamic, params: String): go.Result<go.Slice<go.Byte>>;
    @:native("Unmarshal") static function unmarshal(b: go.Slice<go.Byte>, val: Dynamic): go.Result<go.Slice<go.Byte>>;
    @:native("UnmarshalWithParams") static function unmarshalWithParams(b: go.Slice<go.Byte>, val: Dynamic, params: String): go.Result<go.Slice<go.Byte>>;

}