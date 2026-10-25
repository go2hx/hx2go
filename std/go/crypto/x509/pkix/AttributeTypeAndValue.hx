package go.crypto.x509.pkix;

/**
    AttributeTypeAndValue mirrors the ASN.1 structure of the same name in
    RFC 5280, Section 4.1.2.4.
    
    When parsed as part of a pkix.Name structure in a crypto/x509 type,
    the Value will be
    
      - a string if the ASN.1 type is PrintableString, IA5String,
        NumericString, BMPString, T61String, or UTF8String;
      - an int64 if the ASN.1 type is INTEGER;
      - an asn1.BitString if the ASN.1 type is BIT STRING;
      - a []byte if the ASN.1 type is OCTET STRING;
      - an asn1.ObjectIdentifier if the ASN.1 type is OBJECT IDENTIFIER;
      - a time.Time if the ASN.1 type is UTCTIME or GENERALIZEDTIME;
      - a bool if the ASN.1 type is BOOLEAN;
      - nil if the ASN.1 type is NULL;
      - an asn1.RawValue otherwise.
**/
@:structInit
@:go.Type({ name: "AttributeTypeAndValue", instanceName: "pkix.AttributeTypeAndValue", imports: ["crypto/x509/pkix"] })
extern class AttributeTypeAndValue {

    @:native("Type") var type: go.encoding.asn1.ObjectIdentifier;
    @:native("Value") var value: Dynamic;

    function new(type: go.encoding.asn1.ObjectIdentifier=null, value: Dynamic=null);

}