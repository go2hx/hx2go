package go;

@:go.Type({ name: "net", instanceName: "net.net", imports: ["net"] })
extern class Net {

    @:native("FlagBroadcast") static var FlagBroadcast: go.net.Flags;
    @:native("FlagLoopback") static var FlagLoopback: go.net.Flags;
    @:native("FlagMulticast") static var FlagMulticast: go.net.Flags;
    @:native("FlagPointToPoint") static var FlagPointToPoint: go.net.Flags;
    @:native("FlagRunning") static var FlagRunning: go.net.Flags;
    @:native("FlagUp") static var FlagUp: go.net.Flags;
    @:native("IPv4len") static var IPv4len: go.GoInt;
    @:native("IPv6len") static var IPv6len: go.GoInt;

    @:native("DefaultResolver") static var DefaultResolver: go.Pointer<go.net.Resolver>;
    @:native("IPv4allrouter") static var IPv4allrouter: go.net.IP;
    @:native("IPv4allsys") static var IPv4allsys: go.net.IP;
    @:native("IPv4bcast") static var IPv4bcast: go.net.IP;
    @:native("IPv4zero") static var IPv4zero: go.net.IP;
    @:native("IPv6interfacelocalallnodes") static var IPv6interfacelocalallnodes: go.net.IP;
    @:native("IPv6linklocalallnodes") static var IPv6linklocalallnodes: go.net.IP;
    @:native("IPv6linklocalallrouters") static var IPv6linklocalallrouters: go.net.IP;
    @:native("IPv6loopback") static var IPv6loopback: go.net.IP;
    @:native("IPv6unspecified") static var IPv6unspecified: go.net.IP;
    @:native("IPv6zero") static var IPv6zero: go.net.IP;

    @:native("CIDRMask") static function cIDRMask(ones: go.GoInt, bits: go.GoInt): go.net.IPMask;
    @:native("Dial") static function dial(network: String, address: String): go.Result<go.net.Conn>;
    @:native("DialIP") static function dialIP(network: String, laddr: go.Pointer<go.net.IPAddr>, raddr: go.Pointer<go.net.IPAddr>): go.Result<go.Pointer<go.net.IPConn>>;
    @:native("DialTCP") static function dialTCP(network: String, laddr: go.Pointer<go.net.TCPAddr>, raddr: go.Pointer<go.net.TCPAddr>): go.Result<go.Pointer<go.net.TCPConn>>;
    @:native("DialTimeout") static function dialTimeout(network: String, address: String, timeout: go.time.Duration): go.Result<go.net.Conn>;
    @:native("DialUDP") static function dialUDP(network: String, laddr: go.Pointer<go.net.UDPAddr>, raddr: go.Pointer<go.net.UDPAddr>): go.Result<go.Pointer<go.net.UDPConn>>;
    @:native("DialUnix") static function dialUnix(network: String, laddr: go.Pointer<go.net.UnixAddr>, raddr: go.Pointer<go.net.UnixAddr>): go.Result<go.Pointer<go.net.UnixConn>>;
    @:native("FileConn") static function fileConn(f: go.Pointer<go.os.File>): go.Result<go.net.Conn>;
    @:native("FileListener") static function fileListener(f: go.Pointer<go.os.File>): go.Result<go.net.Listener>;
    @:native("FilePacketConn") static function filePacketConn(f: go.Pointer<go.os.File>): go.Result<go.net.PacketConn>;
    @:native("IPv4") static function iPv4(a: go.Byte, b: go.Byte, c: go.Byte, d: go.Byte): go.net.IP;
    @:native("IPv4Mask") static function iPv4Mask(a: go.Byte, b: go.Byte, c: go.Byte, d: go.Byte): go.net.IPMask;
    @:native("InterfaceAddrs") static function interfaceAddrs(): go.Result<go.Slice<go.net.Addr>>;
    @:native("InterfaceByIndex") static function interfaceByIndex(index: go.GoInt): go.Result<go.Pointer<go.net.Interface>>;
    @:native("InterfaceByName") static function interfaceByName(name: String): go.Result<go.Pointer<go.net.Interface>>;
    @:native("Interfaces") static function interfaces(): go.Result<go.Slice<go.net.Interface>>;
    @:native("JoinHostPort") static function joinHostPort(host: String, port: String): String;
    @:native("Listen") static function listen(network: String, address: String): go.Result<go.net.Listener>;
    @:native("ListenIP") static function listenIP(network: String, laddr: go.Pointer<go.net.IPAddr>): go.Result<go.Pointer<go.net.IPConn>>;
    @:native("ListenMulticastUDP") static function listenMulticastUDP(network: String, ifi: go.Pointer<go.net.Interface>, gaddr: go.Pointer<go.net.UDPAddr>): go.Result<go.Pointer<go.net.UDPConn>>;
    @:native("ListenPacket") static function listenPacket(network: String, address: String): go.Result<go.net.PacketConn>;
    @:native("ListenTCP") static function listenTCP(network: String, laddr: go.Pointer<go.net.TCPAddr>): go.Result<go.Pointer<go.net.TCPListener>>;
    @:native("ListenUDP") static function listenUDP(network: String, laddr: go.Pointer<go.net.UDPAddr>): go.Result<go.Pointer<go.net.UDPConn>>;
    @:native("ListenUnix") static function listenUnix(network: String, laddr: go.Pointer<go.net.UnixAddr>): go.Result<go.Pointer<go.net.UnixListener>>;
    @:native("ListenUnixgram") static function listenUnixgram(network: String, laddr: go.Pointer<go.net.UnixAddr>): go.Result<go.Pointer<go.net.UnixConn>>;
    @:native("LookupAddr") static function lookupAddr(addr: String): go.Result<go.Slice<String>>;
    @:native("LookupCNAME") static function lookupCNAME(host: String): go.Result<String>;
    @:native("LookupHost") static function lookupHost(host: String): go.Result<go.Slice<String>>;
    @:native("LookupIP") static function lookupIP(host: String): go.Result<go.Slice<go.net.IP>>;
    @:native("LookupMX") static function lookupMX(name: String): go.Result<go.Slice<go.Pointer<go.net.MX>>>;
    @:native("LookupNS") static function lookupNS(name: String): go.Result<go.Slice<go.Pointer<go.net.NS>>>;
    @:native("LookupPort") static function lookupPort(network: String, service: String): go.Result<go.GoInt>;
    @:go.Tuple("cname", "addrs", "err") @:native("LookupSRV") static function lookupSRV(service: String, proto: String, name: String): go.Tuple<{ cname: String, addrs: go.Slice<go.Pointer<go.net.SRV>>, err: go.Error }>;
    @:native("LookupTXT") static function lookupTXT(name: String): go.Result<go.Slice<String>>;
    @:go.Tuple("p0", "p1", "p2") @:native("ParseCIDR") static function parseCIDR(s: String): go.Tuple<{ p0: go.net.IP, p1: go.Pointer<go.net.IPNet>, p2: go.Error }>;
    @:native("ParseIP") static function parseIP(s: String): go.net.IP;
    @:native("ParseMAC") static function parseMAC(s: String): go.Result<go.net.HardwareAddr>;
    @:go.Tuple("p0", "p1") @:native("Pipe") static function pipe(): go.Tuple<{ p0: go.net.Conn, p1: go.net.Conn }>;
    @:native("ResolveIPAddr") static function resolveIPAddr(network: String, address: String): go.Result<go.Pointer<go.net.IPAddr>>;
    @:native("ResolveTCPAddr") static function resolveTCPAddr(network: String, address: String): go.Result<go.Pointer<go.net.TCPAddr>>;
    @:native("ResolveUDPAddr") static function resolveUDPAddr(network: String, address: String): go.Result<go.Pointer<go.net.UDPAddr>>;
    @:native("ResolveUnixAddr") static function resolveUnixAddr(network: String, address: String): go.Result<go.Pointer<go.net.UnixAddr>>;
    @:go.Tuple("host", "port", "err") @:native("SplitHostPort") static function splitHostPort(hostport: String): go.Tuple<{ host: String, port: String, err: go.Error }>;
    @:native("TCPAddrFromAddrPort") static function tCPAddrFromAddrPort(addr: go.net.netip.AddrPort): go.Pointer<go.net.TCPAddr>;
    @:native("UDPAddrFromAddrPort") static function uDPAddrFromAddrPort(addr: go.net.netip.AddrPort): go.Pointer<go.net.UDPAddr>;

}