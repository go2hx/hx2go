package go.encoding;

@:go.Type({ name: "asn1", instanceName: "asn1.asn1", imports: ["encoding/asn1"] })
extern class Asn1 {

    @:native("ClassApplication") static var classApplication: go.GoInt;
    @:native("ClassContextSpecific") static var classContextSpecific: go.GoInt;
    @:native("ClassPrivate") static var classPrivate: go.GoInt;
    @:native("ClassUniversal") static var classUniversal: go.GoInt;
    @:native("TagBMPString") static var tagBMPString: go.GoInt;
    @:native("TagBitString") static var tagBitString: go.GoInt;
    @:native("TagBoolean") static var tagBoolean: go.GoInt;
    @:native("TagEnum") static var tagEnum: go.GoInt;
    @:native("TagGeneralString") static var tagGeneralString: go.GoInt;
    @:native("TagGeneralizedTime") static var tagGeneralizedTime: go.GoInt;
    @:native("TagIA5String") static var tagIA5String: go.GoInt;
    @:native("TagInteger") static var tagInteger: go.GoInt;
    @:native("TagNull") static var tagNull: go.GoInt;
    @:native("TagNumericString") static var tagNumericString: go.GoInt;
    @:native("TagOID") static var tagOID: go.GoInt;
    @:native("TagOctetString") static var tagOctetString: go.GoInt;
    @:native("TagPrintableString") static var tagPrintableString: go.GoInt;
    @:native("TagSequence") static var tagSequence: go.GoInt;
    @:native("TagSet") static var tagSet: go.GoInt;
    @:native("TagT61String") static var tagT61String: go.GoInt;
    @:native("TagUTCTime") static var tagUTCTime: go.GoInt;
    @:native("TagUTF8String") static var tagUTF8String: go.GoInt;

    @:native("NullBytes") static var nullBytes: go.Slice<go.Byte>;
    @:native("NullRawValue") static var nullRawValue: go.encoding.asn1.RawValue;

    @:native("Marshal") static function marshal(val: Dynamic): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalWithParams") static function marshalWithParams(val: Dynamic, params: String): (go.Result<go.Slice<go.Byte>>);
    @:native("Unmarshal") static function unmarshal(b: go.Slice<go.Byte>, val: Dynamic): (go.Result<go.Slice<go.Byte>>);
    @:native("UnmarshalWithParams") static function unmarshalWithParams(b: go.Slice<go.Byte>, val: Dynamic, params: String): (go.Result<go.Slice<go.Byte>>);

}