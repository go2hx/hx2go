package go.vendor.golang.org.x.crypto.cryptobyte;

@:go.Type({ name: "String", instanceName: "cryptobyte.String", imports: ["vendor/golang.org/x/crypto/cryptobyte"] })
extern class String {

    @:native("CopyBytes") function copyBytes(out: go.Slice<go.Byte>): Bool;
    @:native("Empty") function empty(): Bool;
    @:native("PeekASN1Tag") function peekASN1Tag(tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadASN1") function readASN1(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadASN1BitString") function readASN1BitString(out: go.Pointer<go.encoding.asn1.BitString>): Bool;
    @:native("ReadASN1BitStringAsBytes") function readASN1BitStringAsBytes(out: go.Pointer<go.Slice<go.Byte>>): Bool;
    @:native("ReadASN1Boolean") function readASN1Boolean(out: go.Pointer<Bool>): Bool;
    @:native("ReadASN1Bytes") function readASN1Bytes(out: go.Pointer<go.Slice<go.Byte>>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadASN1Element") function readASN1Element(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadASN1Enum") function readASN1Enum(out: go.Pointer<go.GoInt>): Bool;
    @:native("ReadASN1GeneralizedTime") function readASN1GeneralizedTime(out: go.Pointer<go.time.Time>): Bool;
    @:native("ReadASN1Int64WithTag") function readASN1Int64WithTag(out: go.Pointer<go.Int64>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadASN1Integer") function readASN1Integer(out: interface{}): Bool;
    @:native("ReadASN1ObjectIdentifier") function readASN1ObjectIdentifier(out: go.Pointer<go.encoding.asn1.ObjectIdentifier>): Bool;
    @:native("ReadASN1UTCTime") function readASN1UTCTime(out: go.Pointer<go.time.Time>): Bool;
    @:native("ReadAnyASN1") function readAnyASN1(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>, outTag: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag>): Bool;
    @:native("ReadAnyASN1Element") function readAnyASN1Element(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>, outTag: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag>): Bool;
    @:native("ReadBytes") function readBytes(out: go.Pointer<go.Slice<go.Byte>>, n: go.GoInt): Bool;
    @:native("ReadOptionalASN1") function readOptionalASN1(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>, outPresent: go.Pointer<Bool>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadOptionalASN1Boolean") function readOptionalASN1Boolean(out: go.Pointer<Bool>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag, defaultValue: Bool): Bool;
    @:native("ReadOptionalASN1Integer") function readOptionalASN1Integer(out: interface{}, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag, defaultValue: interface{}): Bool;
    @:native("ReadOptionalASN1OctetString") function readOptionalASN1OctetString(out: go.Pointer<go.Slice<go.Byte>>, outPresent: go.Pointer<Bool>, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("ReadUint16") function readUint16(out: go.Pointer<go.UInt16>): Bool;
    @:native("ReadUint16LengthPrefixed") function readUint16LengthPrefixed(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>): Bool;
    @:native("ReadUint24") function readUint24(out: go.Pointer<go.UInt32>): Bool;
    @:native("ReadUint24LengthPrefixed") function readUint24LengthPrefixed(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>): Bool;
    @:native("ReadUint32") function readUint32(out: go.Pointer<go.UInt32>): Bool;
    @:native("ReadUint48") function readUint48(out: go.Pointer<go.UInt64>): Bool;
    @:native("ReadUint64") function readUint64(out: go.Pointer<go.UInt64>): Bool;
    @:native("ReadUint8") function readUint8(out: go.Pointer<go.UInt8>): Bool;
    @:native("ReadUint8LengthPrefixed") function readUint8LengthPrefixed(out: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.String>): Bool;
    @:native("Skip") function skip(n: go.GoInt): Bool;
    @:native("SkipASN1") function skipASN1(tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;
    @:native("SkipOptionalASN1") function skipOptionalASN1(tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Bool;

}