package go.encoding.json.jsontext;

/**
    Options configures [NewEncoder], [Encoder.Reset], [NewDecoder],
    and [Decoder.Reset] with specific features.
    Each function takes in a variadic list of options, where properties
    set in later options override the value of previously set properties.
    
    There is a single Options type, which is used with both encoding and decoding.
    Some options affect both operations, while others only affect one operation:
    
      - [AllowDuplicateNames] affects encoding and decoding
      - [AllowInvalidUTF8] affects encoding and decoding
      - [EscapeForHTML] affects encoding only
      - [EscapeForJS] affects encoding only
      - [PreserveRawStrings] affects encoding only
      - [CanonicalizeRawInts] affects encoding only
      - [CanonicalizeRawFloats] affects encoding only
      - [ReorderRawObjects] affects encoding only
      - [SpaceAfterColon] affects encoding only
      - [SpaceAfterComma] affects encoding only
      - [Multiline] affects encoding only
      - [WithIndent] affects encoding only
      - [WithIndentPrefix] affects encoding only
    
    Options that do not affect a particular operation are ignored.
    
    The Options type is identical to [encoding/json.Options] and
    [encoding/json/v2.Options]. Options from the other packages may
    be passed to functionality in this package, but are ignored.
    Options from this package may be used with the other packages.
**/
@:go.Type({ name: "Options", instanceName: "jsontext.Options", imports: ["encoding/json/jsontext"] })
extern typedef Options = Dynamic