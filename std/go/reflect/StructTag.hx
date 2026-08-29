package go.reflect;

/**
    A StructTag is the tag string in a struct field.
    
    By convention, tag strings are a concatenation of
    optionally space-separated key:"value" pairs.
    Each key is a non-empty string consisting of non-control
    characters other than space (U+0020 ' '), quote (U+0022 '"'),
    and colon (U+003A ':').  Each value is quoted using U+0022 '"'
    characters and Go string literal syntax.
**/
@:go.Type({ name: "StructTag", instanceName: "reflect.StructTag", imports: ["reflect"] })
extern typedef StructTag = haxe.extern.EitherType<std.String, {
    /**
        Get returns the value associated with key in the tag string.
        If there is no such key in the tag, Get returns the empty string.
        If the tag does not have the conventional format, the value
        returned by Get is unspecified. To determine whether a tag is
        explicitly set to the empty string, use [StructTag.Lookup].
    **/
    @:native("Get") function get(key: std.String): (std.String);
    /**
        Lookup returns the value associated with key in the tag string.
        If the key is present in the tag the value (which may be empty)
        is returned. Otherwise the returned value will be the empty string.
        The ok return value reports whether the value was explicitly set in
        the tag string. If the tag does not have the conventional format,
        the value returned by Lookup is unspecified.
    **/
    @:go.Tuple("value", "ok") @:native("Lookup") function lookup(key: std.String): (go.Tuple<{ value: std.String, ok: Bool }>);

}>