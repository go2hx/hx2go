package go.encoding.json;

/**
    Before Go 1.2, an InvalidUTF8Error was returned by [Marshal] when
    attempting to encode a string value with invalid UTF-8 sequences.
    As of Go 1.2, [Marshal] instead coerces the string to valid UTF-8 by
    replacing invalid bytes with the Unicode replacement rune U+FFFD.
    
    Deprecated: No longer used; kept for compatibility.
**/
@:structInit
@:go.Type({ name: "InvalidUTF8Error", instanceName: "json.InvalidUTF8Error", imports: ["encoding/json"] })
extern class InvalidUTF8Error {

    @:native("S") var S: String;

    function new(S: String="");

    @:native("Error") function error(): (String);

}