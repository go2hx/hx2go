package go.net.textproto;

/**
    A MIMEHeader represents a MIME-style header mapping
    keys to sets of values.
**/
@:go.Type({ name: "MIMEHeader", instanceName: "textproto.MIMEHeader", imports: ["net/textproto"] })
extern class MIMEHeader {

    /**
        Add adds the key, value pair to the header.
        It appends to any existing values associated with key.
    **/
    @:native("Add") function add(key: String, value: String): Void;
    /**
        Del deletes the values associated with key.
    **/
    @:native("Del") function del(key: String): Void;
    /**
        Get gets the first value associated with the given key.
        It is case insensitive; [CanonicalMIMEHeaderKey] is used
        to canonicalize the provided key.
        If there are no values associated with the key, Get returns "".
        To use non-canonical keys, access the map directly.
    **/
    @:native("Get") function get(key: String): (String);
    /**
        Set sets the header entries associated with key to
        the single element value. It replaces any existing
        values associated with key.
    **/
    @:native("Set") function set(key: String, value: String): Void;
    /**
        Values returns all values associated with the given key.
        It is case insensitive; [CanonicalMIMEHeaderKey] is
        used to canonicalize the provided key. To use non-canonical
        keys, access the map directly.
        The returned slice is not a copy.
    **/
    @:native("Values") function values(key: String): (go.Slice<String>);

}