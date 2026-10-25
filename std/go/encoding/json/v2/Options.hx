package go.encoding.json.v2;

/**
    Options configure [Marshal], [MarshalWrite], [MarshalEncode],
    [Unmarshal], [UnmarshalRead], and [UnmarshalDecode] with specific features.
    Each function takes in a variadic list of options, where properties
    set in later options override the value of previously set properties.
    
    The Options type is identical to [encoding/json.Options] and
    [encoding/json/jsontext.Options]. Options from the other packages can
    be used interchangeably with functionality in this package.
    
    An Options value represents either a single option or a set of options.
    It can be thought of as a Go map of option properties
    (even though the underlying implementation avoids Go maps for performance).
    
    The constructors (e.g., [Deterministic]) return a value for a single option:
    
    	opt := Deterministic(true)
    
    which is analogous to creating a single entry map:
    
    	opt := Options{"Deterministic": true}
    
    [JoinOptions] composes multiple options values together:
    
    	out := JoinOptions(opts...)
    
    which is analogous to making a new map and copying the options over:
    
    	out := make(Options)
    	for _, m := range opts {
    		for k, v := range m {
    			out[k] = v
    		}
    	}
    
    [GetOption] looks up the value of an options parameter:
    
    	v, ok := GetOption(opts, Deterministic)
    
    which is analogous to a Go map lookup:
    
    	v, ok := Options["Deterministic"]
    
    There is a single Options type, which is used with both marshal and unmarshal.
    Some options affect both operations, while others only affect one operation:
    
      - [StringifyNumbers] affects marshaling and unmarshaling
      - [Deterministic] affects marshaling only
      - [FormatNilSliceAsNull] affects marshaling only
      - [FormatNilMapAsNull] affects marshaling only
      - [OmitZeroStructFields] affects marshaling only
      - [MatchCaseInsensitiveNames] affects marshaling and unmarshaling
      - [RejectUnknownMembers] affects unmarshaling only
      - [WithMarshalers] affects marshaling only
      - [WithUnmarshalers] affects unmarshaling only
    
    Options that do not affect a particular operation are ignored.
**/
@:go.Type({ name: "Options", instanceName: "json.Options", imports: ["encoding/json/v2"] })
extern typedef Options = Dynamic