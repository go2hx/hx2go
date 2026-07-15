package go.vendor.golang.org.x.crypto.cryptobyte;

@:structInit
@:go.Type({ name: "Builder", instanceName: "cryptobyte.Builder", imports: ["vendor/golang.org/x/crypto/cryptobyte"] })
extern class Builder {

    @:native("AddASN1") function addASN1(tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag, f: go.vendor.golang.org.x.crypto.cryptobyte.BuilderContinuation): Void;
    @:native("AddASN1BigInt") function addASN1BigInt(n: go.Pointer<go.math.big.Int>): Void;
    @:native("AddASN1BitString") function addASN1BitString(data: go.Slice<go.Byte>): Void;
    @:native("AddASN1Boolean") function addASN1Boolean(v: Bool): Void;
    @:native("AddASN1Enum") function addASN1Enum(v: go.Int64): Void;
    @:native("AddASN1GeneralizedTime") function addASN1GeneralizedTime(t: go.time.Time): Void;
    @:native("AddASN1Int64") function addASN1Int64(v: go.Int64): Void;
    @:native("AddASN1Int64WithTag") function addASN1Int64WithTag(v: go.Int64, tag: go.vendor.golang.org.x.crypto.cryptobyte.asn1.Tag): Void;
    @:native("AddASN1NULL") function addASN1NULL(): Void;
    @:native("AddASN1ObjectIdentifier") function addASN1ObjectIdentifier(oid: go.encoding.asn1.ObjectIdentifier): Void;
    @:native("AddASN1OctetString") function addASN1OctetString(bytes: go.Slice<go.Byte>): Void;
    @:native("AddASN1UTCTime") function addASN1UTCTime(t: go.time.Time): Void;
    @:native("AddASN1Uint64") function addASN1Uint64(v: go.UInt64): Void;
    @:native("AddBytes") function addBytes(v: go.Slice<go.Byte>): Void;
    @:native("AddUint16") function addUint16(v: go.UInt16): Void;
    @:native("AddUint16LengthPrefixed") function addUint16LengthPrefixed(f: go.vendor.golang.org.x.crypto.cryptobyte.BuilderContinuation): Void;
    @:native("AddUint24") function addUint24(v: go.UInt32): Void;
    @:native("AddUint24LengthPrefixed") function addUint24LengthPrefixed(f: go.vendor.golang.org.x.crypto.cryptobyte.BuilderContinuation): Void;
    @:native("AddUint32") function addUint32(v: go.UInt32): Void;
    @:native("AddUint32LengthPrefixed") function addUint32LengthPrefixed(f: go.vendor.golang.org.x.crypto.cryptobyte.BuilderContinuation): Void;
    @:native("AddUint48") function addUint48(v: go.UInt64): Void;
    @:native("AddUint64") function addUint64(v: go.UInt64): Void;
    @:native("AddUint8") function addUint8(v: go.UInt8): Void;
    @:native("AddUint8LengthPrefixed") function addUint8LengthPrefixed(f: go.vendor.golang.org.x.crypto.cryptobyte.BuilderContinuation): Void;
    @:native("AddValue") function addValue(v: go.vendor.golang.org.x.crypto.cryptobyte.MarshalingValue): Void;
    @:native("Bytes") function bytes(): go.Result<go.Slice<go.Byte>>;
    @:native("BytesOrPanic") function bytesOrPanic(): go.Slice<go.Byte>;
    @:native("MarshalASN1") function marshalASN1(v: interface{}): Void;
    @:native("SetError") function setError(err: go.Error): Void;
    @:native("Unwrite") function unwrite(n: go.GoInt): Void;

}