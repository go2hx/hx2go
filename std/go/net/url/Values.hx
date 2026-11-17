package go.net.url;

/**
    Values maps a string key to a list of values.
    It is typically used for query parameters and form values.
    Unlike in the http.Header map, the keys in a Values map
    are case-sensitive.
**/
@:go.Type({ name: "Values", instanceName: "url.Values", imports: ["net/url"] })
extern class Values {

    /**
        Add adds the value to key. It appends to any existing
        values associated with key.
    **/
    @:native("Add") function add(key: String, value: String): Void;
    /**
        Del deletes the values associated with key.
    **/
    @:native("Del") function del(key: String): Void;
    /**
        Encode encodes the values into “URL encoded” form
        ("bar=baz&foo=quux") sorted by key.
    **/
    @:native("Encode") function encode(): (String);
    /**
        Get gets the first value associated with the given key.
        If there are no values associated with the key, Get returns
        the empty string. To access multiple values, use the map
        directly.
    **/
    @:native("Get") function get(key: String): (String);
    /**
        Has checks whether a given key is set.
    **/
    @:native("Has") function has(key: String): (Bool);
    /**
        Set sets the key to value. It replaces any existing
        values.
    **/
    @:native("Set") function set(key: String, value: String): Void;

}