package go.crypto.x509;

@:structInit
@:go.Type({ name: "OID", instanceName: "x509.OID", imports: ["crypto/x509"] })
extern class OID {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Equal") function equal(other: go.crypto.x509.OID): Bool;
    @:native("EqualASN1OID") function equalASN1OID(other: go.encoding.asn1.ObjectIdentifier): Bool;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("String") function string(): String;
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): go.Error;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}