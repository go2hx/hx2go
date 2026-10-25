package go.encoding.json.jsontext;

/**
    Pointer is a JSON Pointer (RFC 6901) that references a particular JSON value
    relative to the root of the top-level JSON value.
    
    A Pointer is a slash-separated list of tokens, where each token is
    either a JSON object name or an index to a JSON array element
    encoded as a base-10 integer value.
    It is impossible to distinguish between an array index and an object name
    (that happens to be a base-10 encoded integer) without also knowing
    the structure of the top-level JSON value that the pointer refers to.
    
    There is exactly one representation of a pointer to a particular value,
    so comparability of Pointer values is equivalent to checking whether
    they both point to the same value.
**/
@:go.Type({ name: "Pointer", instanceName: "jsontext.Pointer", imports: ["encoding/json/jsontext"] })
extern typedef Pointer = haxe.extern.EitherType<std.String, {
    /**
        AppendToken appends a token to the end of p and returns the full pointer.
    **/
    @:native("AppendToken") function appendToken(tok: std.String): (go.encoding.json.jsontext.Pointer);
    /**
        Contains reports whether the JSON value that p points to
        is equal to or contains the JSON value that pc points to.
    **/
    @:native("Contains") function contains(pc: go.encoding.json.jsontext.Pointer): (Bool);
    /**
        IsValid reports whether p is a valid JSON Pointer according to RFC 6901.
        Note that the concatenation of two valid pointers produces a valid pointer.
    **/
    @:native("IsValid") function isValid(): (Bool);
    /**
        LastToken returns the last token in the pointer.
        The last token of an empty Pointer is the empty string.
    **/
    @:native("LastToken") function lastToken(): (std.String);
    /**
        Parent strips off the last token and returns the remaining pointer.
        The parent of an empty Pointer is the empty string.
    **/
    @:native("Parent") function parent(): (go.encoding.json.jsontext.Pointer);
    /**
        Tokens returns an iterator over the reference tokens in the JSON pointer,
        from first to last.
    **/
    @:native("Tokens") function tokens(): (go.iter.Seq<std.String>);

}>