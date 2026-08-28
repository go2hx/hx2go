package go.crypto.x509;

/**
    An OID represents an ASN.1 OBJECT IDENTIFIER.
**/
@:structInit
@:go.Type({ name: "OID", instanceName: "x509.OID", imports: ["crypto/x509"] })
extern class OID {

    /**
        AppendBinary implements [encoding.BinaryAppender]
    **/
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        AppendText implements [encoding.TextAppender]
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Equal returns true when oid and other represents the same Object Identifier.
    **/
    @:native("Equal") function equal(other: go.crypto.x509.OID): (Bool);
    /**
        EqualASN1OID returns whether an OID equals an asn1.ObjectIdentifier. If
        asn1.ObjectIdentifier cannot represent the OID specified by oid, because
        a component of OID requires more than 31 bits, it returns false.
    **/
    @:native("EqualASN1OID") function equalASN1OID(other: go.encoding.asn1.ObjectIdentifier): (Bool);
    /**
        MarshalBinary implements [encoding.BinaryMarshaler]
    **/
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalText implements [encoding.TextMarshaler]
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        String returns the string representation of the Object Identifier.
    **/
    @:native("String") function string(): (String);
    /**
        UnmarshalBinary implements [encoding.BinaryUnmarshaler]
    **/
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): (go.Error);
    /**
        UnmarshalText implements [encoding.TextUnmarshaler]
    **/
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);

}