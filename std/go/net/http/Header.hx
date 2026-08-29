package go.net.http;

/**
    A Header represents the key-value pairs in an HTTP header.
    
    The keys should be in canonical form, as returned by
    [CanonicalHeaderKey].
**/
@:go.Type({ name: "Header", instanceName: "http.Header", imports: ["net/http"] })
extern class Header {

    /**
        Add adds the key, value pair to the header.
        It appends to any existing values associated with key.
        The key is case insensitive; it is canonicalized by
        [CanonicalHeaderKey].
    **/
    @:native("Add") function add(key: String, value: String): Void;
    /**
        Clone returns a copy of h or nil if h is nil.
    **/
    @:native("Clone") function clone(): (go.net.http.Header);
    /**
        Del deletes the values associated with key.
        The key is case insensitive; it is canonicalized by
        [CanonicalHeaderKey].
    **/
    @:native("Del") function del(key: String): Void;
    /**
        Get gets the first value associated with the given key. If
        there are no values associated with the key, Get returns "".
        It is case insensitive; [textproto.CanonicalMIMEHeaderKey] is
        used to canonicalize the provided key. Get assumes that all
        keys are stored in canonical form. To use non-canonical keys,
        access the map directly.
    **/
    @:native("Get") function get(key: String): (String);
    /**
        Set sets the header entries associated with key to the
        single element value. It replaces any existing values
        associated with key. The key is case insensitive; it is
        canonicalized by [textproto.CanonicalMIMEHeaderKey].
        To use non-canonical keys, assign to the map directly.
    **/
    @:native("Set") function set(key: String, value: String): Void;
    /**
        Values returns all values associated with the given key.
        It is case insensitive; [textproto.CanonicalMIMEHeaderKey] is
        used to canonicalize the provided key. To use non-canonical
        keys, access the map directly.
        The returned slice is not a copy.
    **/
    @:native("Values") function values(key: String): (go.Slice<String>);
    /**
        Write writes a header in wire format.
    **/
    @:native("Write") function write(w: go.io.Writer): (go.Error);
    /**
        WriteSubset writes a header in wire format.
        If exclude is not nil, keys where exclude[key] == true are not written.
        Keys are not canonicalized before checking the exclude map.
    **/
    @:native("WriteSubset") function writeSubset(w: go.io.Writer, exclude: go.Map<String, Bool>): (go.Error);

}