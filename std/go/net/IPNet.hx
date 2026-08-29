package go.net;

/**
    An IPNet represents an IP network.
**/
@:structInit
@:go.Type({ name: "IPNet", instanceName: "net.IPNet", imports: ["net"] })
extern class IPNet {

    @:native("IP") var IP: go.net.IP;
    @:native("Mask") var mask: go.net.IPMask;

    function new(IP: go.net.IP=null, mask: go.net.IPMask=null);

    /**
        Contains reports whether the network includes ip.
    **/
    @:native("Contains") function contains(ip: go.net.IP): (Bool);
    /**
        Network returns the address's network name, "ip+net".
    **/
    @:native("Network") function network(): (String);
    /**
        String returns the CIDR notation of n like "192.0.2.0/24"
        or "2001:db8::/48" as defined in RFC 4632 and RFC 4291.
        If the mask is not in the canonical form, it returns the
        string which consists of an IP address, followed by a slash
        character and a mask expressed as hexadecimal form with no
        punctuation like "198.51.100.0/c000ff00".
    **/
    @:native("String") function string(): (String);

}