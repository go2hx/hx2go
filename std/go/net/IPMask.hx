package go.net;

/**
    An IPMask is a bitmask that can be used to manipulate
    IP addresses for IP addressing and routing.
    
    See type [IPNet] and func [ParseCIDR] for details.
**/
@:go.Type({ name: "IPMask", instanceName: "net.IPMask", imports: ["net"] })
extern class IPMask {

    /**
        Size returns the number of leading ones and total bits in the mask.
        If the mask is not in the canonical form--ones followed by zeros--then
        Size returns 0, 0.
    **/
    @:go.Tuple("ones", "bits") @:native("Size") function size(): (go.Tuple<{ ones: go.GoInt, bits: go.GoInt }>);
    /**
        String returns the hexadecimal form of m, with no punctuation.
    **/
    @:native("String") function string(): (String);

}