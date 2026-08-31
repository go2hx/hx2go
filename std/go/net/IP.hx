package go.net;

/**
    An IP is a single IP address, a slice of bytes.
    Functions in this package accept either 4-byte (IPv4)
    or 16-byte (IPv6) slices as input.
    
    Note that in this documentation, referring to an
    IP address as an IPv4 address or an IPv6 address
    is a semantic property of the address, not just the
    length of the byte slice: a 16-byte slice can still
    be an IPv4 address.
**/
@:go.Type({ name: "IP", instanceName: "net.IP", imports: ["net"] })
extern class IP {

    /**
        AppendText implements the [encoding.TextAppender] interface.
        The encoding is the same as returned by [IP.String], with one exception:
        When len(ip) is zero, it appends nothing.
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        DefaultMask returns the default IP mask for the IP address ip.
        Only IPv4 addresses have default masks; DefaultMask returns
        nil if ip is not a valid IPv4 address.
    **/
    @:native("DefaultMask") function defaultMask(): (go.net.IPMask);
    /**
        Equal reports whether ip and x are the same IP address.
        An IPv4 address and that same address in IPv6 form are
        considered to be equal.
    **/
    @:native("Equal") function equal(x: go.net.IP): (Bool);
    /**
        IsGlobalUnicast reports whether ip is a global unicast
        address.
        
        The identification of global unicast addresses uses address type
        identification as defined in RFC 1122, RFC 4632 and RFC 4291 with
        the exception of IPv4 directed broadcast addresses.
        It returns true even if ip is in IPv4 private address space or
        local IPv6 unicast address space.
    **/
    @:native("IsGlobalUnicast") function isGlobalUnicast(): (Bool);
    /**
        IsInterfaceLocalMulticast reports whether ip is
        an interface-local multicast address.
    **/
    @:native("IsInterfaceLocalMulticast") function isInterfaceLocalMulticast(): (Bool);
    /**
        IsLinkLocalMulticast reports whether ip is a link-local
        multicast address.
    **/
    @:native("IsLinkLocalMulticast") function isLinkLocalMulticast(): (Bool);
    /**
        IsLinkLocalUnicast reports whether ip is a link-local
        unicast address.
    **/
    @:native("IsLinkLocalUnicast") function isLinkLocalUnicast(): (Bool);
    /**
        IsLoopback reports whether ip is a loopback address.
    **/
    @:native("IsLoopback") function isLoopback(): (Bool);
    /**
        IsMulticast reports whether ip is a multicast address.
    **/
    @:native("IsMulticast") function isMulticast(): (Bool);
    /**
        IsPrivate reports whether ip is a private address, according to
        RFC 1918 (IPv4 addresses) and RFC 4193 (IPv6 addresses).
    **/
    @:native("IsPrivate") function isPrivate(): (Bool);
    /**
        IsUnspecified reports whether ip is an unspecified address, either
        the IPv4 address "0.0.0.0" or the IPv6 address "::".
    **/
    @:native("IsUnspecified") function isUnspecified(): (Bool);
    /**
        MarshalText implements the [encoding.TextMarshaler] interface.
        The encoding is the same as returned by [IP.String], with one exception:
        When len(ip) is zero, it returns an empty slice.
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        Mask returns the result of masking the IP address ip with mask.
    **/
    @:native("Mask") function mask(mask: go.net.IPMask): (go.net.IP);
    /**
        String returns the string form of the IP address ip.
        It returns one of 4 forms:
          - "<nil>", if ip has length 0
          - dotted decimal ("192.0.2.1"), if ip is an IPv4 or IP4-mapped IPv6 address
          - IPv6 conforming to RFC 5952 ("2001:db8::1"), if ip is a valid IPv6 address
          - the hexadecimal form of ip, without punctuation, if no other cases apply
    **/
    @:native("String") function string(): (String);
    /**
        To16 converts the IP address ip to a 16-byte representation.
        If ip is not an IP address (it is the wrong length), To16 returns nil.
    **/
    @:native("To16") function to16(): (go.net.IP);
    /**
        To4 converts the IPv4 address ip to a 4-byte representation.
        If ip is not an IPv4 address, To4 returns nil.
    **/
    @:native("To4") function to4(): (go.net.IP);
    /**
        UnmarshalText implements the [encoding.TextUnmarshaler] interface.
        The IP address is expected in a form accepted by [ParseIP].
    **/
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);

}