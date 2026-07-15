package go.net;

@:go.Type({ name: "netip", instanceName: "netip.netip", imports: ["net/netip"] })
extern class Netip {

    @:native("AddrFrom16") static function addrFrom16(addr: go.GoArray<go.Byte, 16>): go.net.netip.Addr;
    @:native("AddrFrom4") static function addrFrom4(addr: go.GoArray<go.Byte, 4>): go.net.netip.Addr;
    @:go.Tuple("ip", "ok") @:native("AddrFromSlice") static function addrFromSlice(slice: go.Slice<go.Byte>): go.Tuple<{ ip: go.net.netip.Addr, ok: Bool }>;
    @:native("AddrPortFrom") static function addrPortFrom(ip: go.net.netip.Addr, port: go.UInt16): go.net.netip.AddrPort;
    @:native("IPv4Unspecified") static function iPv4Unspecified(): go.net.netip.Addr;
    @:native("IPv6LinkLocalAllNodes") static function iPv6LinkLocalAllNodes(): go.net.netip.Addr;
    @:native("IPv6LinkLocalAllRouters") static function iPv6LinkLocalAllRouters(): go.net.netip.Addr;
    @:native("IPv6Loopback") static function iPv6Loopback(): go.net.netip.Addr;
    @:native("IPv6Unspecified") static function iPv6Unspecified(): go.net.netip.Addr;
    @:native("MustParseAddr") static function mustParseAddr(s: String): go.net.netip.Addr;
    @:native("MustParseAddrPort") static function mustParseAddrPort(s: String): go.net.netip.AddrPort;
    @:native("MustParsePrefix") static function mustParsePrefix(s: String): go.net.netip.Prefix;
    @:native("ParseAddr") static function parseAddr(s: String): go.Result<go.net.netip.Addr>;
    @:native("ParseAddrPort") static function parseAddrPort(s: String): go.Result<go.net.netip.AddrPort>;
    @:native("ParsePrefix") static function parsePrefix(s: String): go.Result<go.net.netip.Prefix>;
    @:native("PrefixFrom") static function prefixFrom(ip: go.net.netip.Addr, bits: go.GoInt): go.net.netip.Prefix;

}