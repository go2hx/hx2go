package go.uuid;

/**
    A UUID is a Universally Unique Identifier as specified in RFC 9562.
    
    UUIDs are comparable, such as with the == operator.
**/
@:go.Type({ name: "UUID", instanceName: "uuid.UUID", imports: ["uuid"] })
extern class UUID {

    /**
        AppendText implements the [encoding.TextAppender] interface.
        The encoding is the same as returned by [UUID.String]
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Compare compares the UUID u with v.
        If u is before v, it returns -1.
        If u is after v, it returns +1.
        If they are the same, it returns 0.
        
        Compare uses the big-endian byte order defined in
        [Section 6.11 of RFC 9562] for sorting.
        
        [Section 6.11 of RFC 9562]: https://www.rfc-editor.org/rfc/rfc9562#section-6.11
    **/
    @:native("Compare") function compare(v: go.uuid.UUID): (go.GoInt);
    /**
        MarshalText implements the [encoding.TextMarshaler] interface.
        The encoding is the same as returned by [UUID.String]
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        String returns the string representation of u.
        
        It uses the lowercase hex-and-dash representation defined in RFC 9562.
    **/
    @:native("String") function string(): (String);
    /**
        UnmarshalText implements the [encoding.TextUnmarshaler] interface.
        The UUID is expected in a form accepted by [Parse].
    **/
    @:native("UnmarshalText") function unmarshalText(b: go.Slice<go.Byte>): (go.Error);

}