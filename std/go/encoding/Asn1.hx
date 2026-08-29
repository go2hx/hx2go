package go.encoding;

/**
    Package asn1 implements parsing of DER-encoded ASN.1 data structures,
    as defined in ITU-T Rec X.690.
    
    See also “A Layman's Guide to a Subset of ASN.1, BER, and DER,”
    http://luca.ntop.org/Teaching/Appunti/asn1.html.
**/
@:go.Type({ name: "asn1", instanceName: "asn1.asn1", imports: ["encoding/asn1"] })
extern class Asn1 {

    /**
        ASN.1 class types represent the namespace of the tag.
    **/
    @:native("ClassApplication") static var classApplication: go.GoInt;
    /**
        ASN.1 class types represent the namespace of the tag.
    **/
    @:native("ClassContextSpecific") static var classContextSpecific: go.GoInt;
    /**
        ASN.1 class types represent the namespace of the tag.
    **/
    @:native("ClassPrivate") static var classPrivate: go.GoInt;
    /**
        ASN.1 class types represent the namespace of the tag.
    **/
    @:native("ClassUniversal") static var classUniversal: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagBMPString") static var tagBMPString: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagBitString") static var tagBitString: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagBoolean") static var tagBoolean: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagEnum") static var tagEnum: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagGeneralString") static var tagGeneralString: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagGeneralizedTime") static var tagGeneralizedTime: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagIA5String") static var tagIA5String: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagInteger") static var tagInteger: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagNull") static var tagNull: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagNumericString") static var tagNumericString: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagOID") static var tagOID: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagOctetString") static var tagOctetString: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagPrintableString") static var tagPrintableString: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagSequence") static var tagSequence: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagSet") static var tagSet: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagT61String") static var tagT61String: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagUTCTime") static var tagUTCTime: go.GoInt;
    /**
        ASN.1 tags represent the type of the following object.
    **/
    @:native("TagUTF8String") static var tagUTF8String: go.GoInt;

    /**
        NullBytes contains bytes representing the DER-encoded ASN.1 NULL type.
    **/
    @:native("NullBytes") static var nullBytes: go.Slice<go.Byte>;
    /**
        NullRawValue is a [RawValue] with its Tag set to the ASN.1 NULL type tag (5).
    **/
    @:native("NullRawValue") static var nullRawValue: go.encoding.asn1.RawValue;

    /**
        Marshal returns the ASN.1 encoding of val.
        
        In addition to the struct tags recognized by Unmarshal, the following can be
        used:
        
        	ia5:         causes strings to be marshaled as ASN.1, IA5String values
        	omitempty:   causes empty slices to be skipped
        	printable:   causes strings to be marshaled as ASN.1, PrintableString values
        	utf8:        causes strings to be marshaled as ASN.1, UTF8String values
        	numeric:     causes strings to be marshaled as ASN.1, NumericString values
        	utc:         causes time.Time to be marshaled as ASN.1, UTCTime values
        	generalized: causes time.Time to be marshaled as ASN.1, GeneralizedTime values
    **/
    @:native("Marshal") static function marshal(val: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalWithParams allows field parameters to be specified for the
        top-level element. The form of the params is the same as the field tags.
    **/
    @:native("MarshalWithParams") static function marshalWithParams(val: Dynamic, params: String): (go.Result<go.Slice<go.Byte>>);
    /**
        Unmarshal parses the DER-encoded ASN.1 data structure b
        and uses the reflect package to fill in an arbitrary value pointed at by val.
        Because Unmarshal uses the reflect package, the structs
        being written to must use upper case field names. If val
        is nil or not a pointer, Unmarshal returns an error.
        
        After parsing b, any bytes that were leftover and not used to fill
        val will be returned in rest. When parsing a SEQUENCE into a struct,
        any trailing elements of the SEQUENCE that do not have matching
        fields in val will not be included in rest, as these are considered
        valid elements of the SEQUENCE and not trailing data.
        
          - An ASN.1 INTEGER can be written to an int, int32, int64,
            or *[big.Int].
            If the encoded value does not fit in the Go type,
            Unmarshal returns a parse error.
        
          - An ASN.1 BIT STRING can be written to a [BitString].
        
          - An ASN.1 OCTET STRING can be written to a []byte.
        
          - An ASN.1 OBJECT IDENTIFIER can be written to an [ObjectIdentifier].
        
          - An ASN.1 ENUMERATED can be written to an [Enumerated].
        
          - An ASN.1 UTCTIME or GENERALIZEDTIME can be written to a [time.Time].
        
          - An ASN.1 PrintableString, IA5String, or NumericString can be written to a string.
        
          - Any of the above ASN.1 values can be written to an interface{}.
            The value stored in the interface has the corresponding Go type.
            For integers, that type is int64.
        
          - An ASN.1 SEQUENCE OF x or SET OF x can be written
            to a slice if an x can be written to the slice's element type.
        
          - An ASN.1 SEQUENCE or SET can be written to a struct
            if each of the elements in the sequence can be
            written to the corresponding element in the struct.
        
        The following tags on struct fields have special meaning to Unmarshal:
        
        	application specifies that an APPLICATION tag is used
        	private     specifies that a PRIVATE tag is used
        	default:x   sets the default value for optional integer fields (only used if optional is also present)
        	explicit    specifies that an additional, explicit tag wraps the implicit one
        	optional    marks the field as ASN.1 OPTIONAL
        	set         causes a SET, rather than a SEQUENCE type to be expected
        	tag:x       specifies the ASN.1 tag number; implies ASN.1 CONTEXT SPECIFIC
        
        When decoding an ASN.1 value with an IMPLICIT tag into a string field,
        Unmarshal will default to a PrintableString, which doesn't support
        characters such as '@' and '&'. To force other encodings, use the following
        tags:
        
        	ia5     causes strings to be unmarshaled as ASN.1 IA5String values
        	numeric causes strings to be unmarshaled as ASN.1 NumericString values
        	utf8    causes strings to be unmarshaled as ASN.1 UTF8String values
        
        When decoding an ASN.1 value with an IMPLICIT tag into a time.Time field,
        Unmarshal will default to a UTCTime, which doesn't support time zones or
        fractional seconds. To force usage of GeneralizedTime, use the following
        tag:
        
        	generalized causes time.Times to be unmarshaled as ASN.1 GeneralizedTime values
        
        If the type of the first field of a structure is RawContent then the raw
        ASN1 contents of the struct will be stored in it.
        
        If the name of a slice type ends with "SET" then it's treated as if
        the "set" tag was set on it. This results in interpreting the type as a
        SET OF x rather than a SEQUENCE OF x. This can be used with nested slices
        where a struct tag cannot be given.
        
        Other ASN.1 types are not supported; if it encounters them,
        Unmarshal returns a parse error.
    **/
    @:native("Unmarshal") static function unmarshal(b: go.Slice<go.Byte>, val: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        UnmarshalWithParams allows field parameters to be specified for the
        top-level element. The form of the params is the same as the field tags.
    **/
    @:native("UnmarshalWithParams") static function unmarshalWithParams(b: go.Slice<go.Byte>, val: Dynamic, params: String): (go.Result<go.Slice<go.Byte>>);

}