package go.net.mail;

/**
    A Header represents the key-value pairs in a mail message header.
**/
@:go.Type({ name: "Header", instanceName: "mail.Header", imports: ["net/mail"] })
extern class Header {

    /**
        AddressList parses the named header field as a list of addresses.
    **/
    @:native("AddressList") function addressList(key: String): (go.Result<go.Slice<go.Pointer<go.net.mail.Address>>>);
    /**
        Date parses the Date header field.
    **/
    @:native("Date") function date(): (go.Result<go.time.Time>);
    /**
        Get gets the first value associated with the given key.
        It is case insensitive; CanonicalMIMEHeaderKey is used
        to canonicalize the provided key.
        If there are no values associated with the key, Get returns "".
        To access multiple values of a key, or to use non-canonical keys,
        access the map directly.
    **/
    @:native("Get") function get(key: String): (String);

}