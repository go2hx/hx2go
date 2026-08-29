package go.net;

/**
    Package netip defines an IP address type that's a small value type.
    Building on that [Addr] type, the package also defines [AddrPort] (an
    IP address and a port) and [Prefix] (an IP address and a bit length
    prefix).
    
    Compared to the [net.IP] type, [Addr] type takes less memory, is immutable,
    and is comparable (supports == and being a map key).
**/
@:go.Type({ name: "netip", instanceName: "netip.netip", imports: ["net/netip"] })
extern class Netip {

    /**
        AddrFrom16 returns the IPv6 address given by the bytes in addr.
        An IPv4-mapped IPv6 address is left as an IPv6 address.
        (Use Unmap to convert them if needed.)
    **/
    @:native("AddrFrom16") static function addrFrom16(addr: go.GoArray<go.Byte, 16>): (go.net.netip.Addr);
    /**
        AddrFrom4 returns the address of the IPv4 address given by the bytes in addr.
    **/
    @:native("AddrFrom4") static function addrFrom4(addr: go.GoArray<go.Byte, 4>): (go.net.netip.Addr);
    /**
        AddrFromSlice parses the 4- or 16-byte byte slice as an IPv4 or IPv6 address.
        Note that a [net.IP] can be passed directly as the []byte argument.
        If slice's length is not 4 or 16, AddrFromSlice returns [Addr]{}, false.
    **/
    @:go.Tuple("ip", "ok") @:native("AddrFromSlice") static function addrFromSlice(slice: go.Slice<go.Byte>): (go.Tuple<{ ip: go.net.netip.Addr, ok: Bool }>);
    /**
        AddrPortFrom returns an [AddrPort] with the provided IP and port.
        It does not allocate.
    **/
    @:native("AddrPortFrom") static function addrPortFrom(ip: go.net.netip.Addr, port: go.UInt16): (go.net.netip.AddrPort);
    /**
        IPv4Unspecified returns the IPv4 unspecified address "0.0.0.0".
    **/
    @:native("IPv4Unspecified") static function iPv4Unspecified(): (go.net.netip.Addr);
    /**
        IPv6LinkLocalAllNodes returns the IPv6 link-local all nodes multicast
        address ff02::1.
    **/
    @:native("IPv6LinkLocalAllNodes") static function iPv6LinkLocalAllNodes(): (go.net.netip.Addr);
    /**
        IPv6LinkLocalAllRouters returns the IPv6 link-local all routers multicast
        address ff02::2.
    **/
    @:native("IPv6LinkLocalAllRouters") static function iPv6LinkLocalAllRouters(): (go.net.netip.Addr);
    /**
        IPv6Loopback returns the IPv6 loopback address ::1.
    **/
    @:native("IPv6Loopback") static function iPv6Loopback(): (go.net.netip.Addr);
    /**
        IPv6Unspecified returns the IPv6 unspecified address "::".
    **/
    @:native("IPv6Unspecified") static function iPv6Unspecified(): (go.net.netip.Addr);
    /**
        MustParseAddr calls [ParseAddr](s) and panics on error.
        It is intended for use in tests with hard-coded strings.
    **/
    @:native("MustParseAddr") static function mustParseAddr(s: String): (go.net.netip.Addr);
    /**
        MustParseAddrPort calls [ParseAddrPort](s) and panics on error.
        It is intended for use in tests with hard-coded strings.
    **/
    @:native("MustParseAddrPort") static function mustParseAddrPort(s: String): (go.net.netip.AddrPort);
    /**
        MustParsePrefix calls [ParsePrefix](s) and panics on error.
        It is intended for use in tests with hard-coded strings.
    **/
    @:native("MustParsePrefix") static function mustParsePrefix(s: String): (go.net.netip.Prefix);
    /**
        ParseAddr parses s as an IP address, returning the result. The string
        s can be in dotted decimal ("192.0.2.1"), IPv6 ("2001:db8::68"),
        or IPv6 with a scoped addressing zone ("fe80::1cc0:3e8c:119f:c2e1%ens18").
    **/
    @:native("ParseAddr") static function parseAddr(s: String): (go.Result<go.net.netip.Addr>);
    /**
        ParseAddrPort parses s as an [AddrPort].
        
        It doesn't do any name resolution: both the address and the port
        must be numeric.
    **/
    @:native("ParseAddrPort") static function parseAddrPort(s: String): (go.Result<go.net.netip.AddrPort>);
    /**
        ParsePrefix parses s as an IP address prefix.
        The string can be in the form "192.168.1.0/24" or "2001:db8::/32",
        the CIDR notation defined in RFC 4632 and RFC 4291.
        IPv6 zones are not permitted in prefixes, and an error will be returned if a
        zone is present.
        
        Note that masked address bits are not zeroed. Use Masked for that.
    **/
    @:native("ParsePrefix") static function parsePrefix(s: String): (go.Result<go.net.netip.Prefix>);
    /**
        PrefixFrom returns a [Prefix] with the provided IP address and bit
        prefix length.
        
        It does not allocate. Unlike [Addr.Prefix], [PrefixFrom] does not mask
        off the host bits of ip.
        
        If bits is less than zero or greater than ip.BitLen, [Prefix.Bits]
        will return an invalid value -1.
    **/
    @:native("PrefixFrom") static function prefixFrom(ip: go.net.netip.Addr, bits: go.GoInt): (go.net.netip.Prefix);

}