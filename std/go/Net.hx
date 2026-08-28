package go;

/**
    Package net provides a portable interface for network I/O, including
    TCP/IP, UDP, domain name resolution, and Unix domain sockets.
    
    Although the package provides access to low-level networking
    primitives, most clients will need only the basic interface provided
    by the [Dial], [Listen], and Accept functions and the associated
    [Conn] and [Listener] interfaces. The crypto/tls package uses
    the same interfaces and similar Dial and Listen functions.
    
    The Dial function connects to a server:
    
    	conn, err := net.Dial("tcp", "golang.org:80")
    	if err != nil {
    		// handle error
    	}
    	fmt.Fprintf(conn, "GET / HTTP/1.0\r\n\r\n")
    	status, err := bufio.NewReader(conn).ReadString('\n')
    	// ...
    
    The Listen function creates servers:
    
    	ln, err := net.Listen("tcp", ":8080")
    	if err != nil {
    		// handle error
    	}
    	for {
    		conn, err := ln.Accept()
    		if err != nil {
    			// handle error
    		}
    		go handleConnection(conn)
    	}
    
    # Name Resolution
    
    The method for resolving domain names, whether indirectly with functions like Dial
    or directly with functions like [LookupHost] and [LookupAddr], varies by operating system.
    
    On Unix systems, the resolver has two options for resolving names.
    It can use a pure Go resolver that sends DNS requests directly to the servers
    listed in /etc/resolv.conf, or it can use a cgo-based resolver that calls C
    library routines such as getaddrinfo and getnameinfo.
    
    On Unix the pure Go resolver is preferred over the cgo resolver, because a blocked DNS
    request consumes only a goroutine, while a blocked C call consumes an operating system thread.
    When cgo is available, the cgo-based resolver is used instead under a variety of
    conditions: on systems that do not let programs make direct DNS requests (OS X),
    when the LOCALDOMAIN environment variable is present (even if empty),
    when the RES_OPTIONS or HOSTALIASES environment variable is non-empty,
    when the ASR_CONFIG environment variable is non-empty (OpenBSD only),
    when /etc/resolv.conf or /etc/nsswitch.conf specify the use of features that the
    Go resolver does not implement.
    
    On all systems (except Plan 9), when the cgo resolver is being used
    this package applies a concurrent cgo lookup limit to prevent the system
    from running out of system threads. Currently, it is limited to 500 concurrent lookups.
    
    The resolver decision can be overridden by setting the netdns value of the
    GODEBUG environment variable (see package runtime) to go or cgo, as in:
    
    	export GODEBUG=netdns=go    # force pure Go resolver
    	export GODEBUG=netdns=cgo   # force native resolver (cgo, win32)
    
    The decision can also be forced while building the Go source tree
    by setting the netgo or netcgo build tag.
    The netgo build tag disables entirely the use of the native (CGO) resolver,
    meaning the Go resolver is the only one that can be used.
    With the netcgo build tag the native and the pure Go resolver are compiled into the binary,
    but the native (CGO) resolver is preferred over the Go resolver.
    With netcgo, the Go resolver can still be forced at runtime with GODEBUG=netdns=go.
    
    A numeric netdns setting, as in GODEBUG=netdns=1, causes the resolver
    to print debugging information about its decisions.
    To force a particular resolver while also printing debugging information,
    join the two settings by a plus sign, as in GODEBUG=netdns=go+1.
    
    The Go resolver will send an EDNS0 additional header with a DNS request,
    to signal a willingness to accept a larger DNS packet size.
    This can reportedly cause sporadic failures with the DNS server run
    by some modems and routers. Setting GODEBUG=netedns0=0 will disable
    sending the additional header.
    
    On macOS, if Go code that uses the net package is built with
    -buildmode=c-archive, linking the resulting archive into a C program
    requires passing -lresolv when linking the C code.
    
    On Plan 9, the resolver always accesses /net/cs and /net/dns.
    
    On Windows, in Go 1.18.x and earlier, the resolver always used C
    library functions, such as GetAddrInfo and DnsQuery.
**/
@:go.Type({ name: "net", instanceName: "net.net", imports: ["net"] })
extern class Net {

    @:native("FlagBroadcast") static var flagBroadcast: go.net.Flags;
    @:native("FlagLoopback") static var flagLoopback: go.net.Flags;
    @:native("FlagMulticast") static var flagMulticast: go.net.Flags;
    @:native("FlagPointToPoint") static var flagPointToPoint: go.net.Flags;
    @:native("FlagRunning") static var flagRunning: go.net.Flags;
    @:native("FlagUp") static var flagUp: go.net.Flags;
    /**
        IP address lengths (bytes).
    **/
    @:native("IPv4len") static var iPv4len: go.GoInt;
    /**
        IP address lengths (bytes).
    **/
    @:native("IPv6len") static var iPv6len: go.GoInt;

    /**
        DefaultResolver is the resolver used by the package-level Lookup
        functions and by Dialers without a specified Resolver.
    **/
    @:native("DefaultResolver") static var defaultResolver: go.Pointer<go.net.Resolver>;
    /**
        Well-known IPv4 addresses
    **/
    @:native("IPv4allrouter") static var iPv4allrouter: go.net.IP;
    /**
        Well-known IPv4 addresses
    **/
    @:native("IPv4allsys") static var iPv4allsys: go.net.IP;
    /**
        Well-known IPv4 addresses
    **/
    @:native("IPv4bcast") static var iPv4bcast: go.net.IP;
    /**
        Well-known IPv4 addresses
    **/
    @:native("IPv4zero") static var iPv4zero: go.net.IP;
    /**
        Well-known IPv6 addresses
    **/
    @:native("IPv6interfacelocalallnodes") static var iPv6interfacelocalallnodes: go.net.IP;
    /**
        Well-known IPv6 addresses
    **/
    @:native("IPv6linklocalallnodes") static var iPv6linklocalallnodes: go.net.IP;
    /**
        Well-known IPv6 addresses
    **/
    @:native("IPv6linklocalallrouters") static var iPv6linklocalallrouters: go.net.IP;
    /**
        Well-known IPv6 addresses
    **/
    @:native("IPv6loopback") static var iPv6loopback: go.net.IP;
    /**
        Well-known IPv6 addresses
    **/
    @:native("IPv6unspecified") static var iPv6unspecified: go.net.IP;
    /**
        Well-known IPv6 addresses
    **/
    @:native("IPv6zero") static var iPv6zero: go.net.IP;

    /**
        CIDRMask returns an [IPMask] consisting of 'ones' 1 bits
        followed by 0s up to a total length of 'bits' bits.
        For a mask of this form, CIDRMask is the inverse of [IPMask.Size].
    **/
    @:native("CIDRMask") static function cIDRMask(ones: go.GoInt, bits: go.GoInt): (go.net.IPMask);
    /**
        Dial connects to the address on the named network.
        
        Known networks are "tcp", "tcp4" (IPv4-only), "tcp6" (IPv6-only),
        "udp", "udp4" (IPv4-only), "udp6" (IPv6-only), "ip", "ip4"
        (IPv4-only), "ip6" (IPv6-only), "unix", "unixgram" and
        "unixpacket".
        
        For TCP and UDP networks, the address has the form "host:port".
        The host must be a literal IP address, or a host name that can be
        resolved to IP addresses.
        The port must be a literal port number or a service name.
        If the host is a literal IPv6 address it must be enclosed in square
        brackets, as in "[2001:db8::1]:80" or "[fe80::1%zone]:80".
        The zone specifies the scope of the literal IPv6 address as defined
        in RFC 4007.
        The functions [JoinHostPort] and [SplitHostPort] manipulate a pair of
        host and port in this form.
        When using TCP, and the host resolves to multiple IP addresses,
        Dial will try each IP address in order until one succeeds.
        
        Examples:
        
        	Dial("tcp", "golang.org:http")
        	Dial("tcp", "192.0.2.1:http")
        	Dial("tcp", "198.51.100.1:80")
        	Dial("udp", "[2001:db8::1]:domain")
        	Dial("udp", "[fe80::1%lo0]:53")
        	Dial("tcp", ":80")
        
        For IP networks, the network must be "ip", "ip4" or "ip6" followed
        by a colon and a literal protocol number or a protocol name, and
        the address has the form "host". The host must be a literal IP
        address or a literal IPv6 address with zone.
        It depends on each operating system how the operating system
        behaves with a non-well known protocol number such as "0" or "255".
        
        Examples:
        
        	Dial("ip4:1", "192.0.2.1")
        	Dial("ip6:ipv6-icmp", "2001:db8::1")
        	Dial("ip6:58", "fe80::1%lo0")
        
        For TCP, UDP and IP networks, if the host is empty or a literal
        unspecified IP address, as in ":80", "0.0.0.0:80" or "[::]:80" for
        TCP and UDP, "", "0.0.0.0" or "::" for IP, the local system is
        assumed.
        
        For Unix networks, the address must be a file system path.
    **/
    @:native("Dial") static function dial(network: String, address: String): (go.Result<go.net.Conn>);
    /**
        DialIP acts like [Dial] for IP networks.
        
        The network must be an IP network name; see func Dial for details.
        
        If laddr is nil, a local address is automatically chosen.
        If the IP field of raddr is nil or an unspecified IP address, the
        local system is assumed.
    **/
    @:native("DialIP") static function dialIP(network: String, laddr: go.Pointer<go.net.IPAddr>, raddr: go.Pointer<go.net.IPAddr>): (go.Result<go.Pointer<go.net.IPConn>>);
    /**
        DialTCP acts like [Dial] for TCP networks.
        
        The network must be a TCP network name; see func Dial for details.
        
        If laddr is nil, a local address is automatically chosen.
        If the IP field of raddr is nil or an unspecified IP address, the
        local system is assumed.
    **/
    @:native("DialTCP") static function dialTCP(network: String, laddr: go.Pointer<go.net.TCPAddr>, raddr: go.Pointer<go.net.TCPAddr>): (go.Result<go.Pointer<go.net.TCPConn>>);
    /**
        DialTimeout acts like [Dial] but takes a timeout.
        
        The timeout includes name resolution, if required.
        When using TCP, and the host in the address parameter resolves to
        multiple IP addresses, the timeout is spread over each consecutive
        dial, such that each is given an appropriate fraction of the time
        to connect.
        
        See func Dial for a description of the network and address
        parameters.
    **/
    @:native("DialTimeout") static function dialTimeout(network: String, address: String, timeout: go.time.Duration): (go.Result<go.net.Conn>);
    /**
        DialUDP acts like [Dial] for UDP networks.
        
        The network must be a UDP network name; see func [Dial] for details.
        
        If laddr is nil, a local address is automatically chosen.
        If the IP field of raddr is nil or an unspecified IP address, the
        local system is assumed.
    **/
    @:native("DialUDP") static function dialUDP(network: String, laddr: go.Pointer<go.net.UDPAddr>, raddr: go.Pointer<go.net.UDPAddr>): (go.Result<go.Pointer<go.net.UDPConn>>);
    /**
        DialUnix acts like [Dial] for Unix networks.
        
        The network must be a Unix network name; see func [Dial] for details.
        
        If laddr is non-nil, it is used as the local address for the
        connection.
    **/
    @:native("DialUnix") static function dialUnix(network: String, laddr: go.Pointer<go.net.UnixAddr>, raddr: go.Pointer<go.net.UnixAddr>): (go.Result<go.Pointer<go.net.UnixConn>>);
    /**
        FileConn returns a copy of the network connection corresponding to
        the open file f.
        It is the caller's responsibility to close f when finished.
        Closing c does not affect f, and closing f does not affect c.
    **/
    @:native("FileConn") static function fileConn(f: go.Pointer<go.os.File>): (go.Result<go.net.Conn>);
    /**
        FileListener returns a copy of the network listener corresponding
        to the open file f.
        It is the caller's responsibility to close ln when finished.
        Closing ln does not affect f, and closing f does not affect ln.
    **/
    @:native("FileListener") static function fileListener(f: go.Pointer<go.os.File>): (go.Result<go.net.Listener>);
    /**
        FilePacketConn returns a copy of the packet network connection
        corresponding to the open file f.
        It is the caller's responsibility to close f when finished.
        Closing c does not affect f, and closing f does not affect c.
    **/
    @:native("FilePacketConn") static function filePacketConn(f: go.Pointer<go.os.File>): (go.Result<go.net.PacketConn>);
    /**
        IPv4 returns the IP address (in 16-byte form) of the
        IPv4 address a.b.c.d.
    **/
    @:native("IPv4") static function iPv4(a: go.Byte, b: go.Byte, c: go.Byte, d: go.Byte): (go.net.IP);
    /**
        IPv4Mask returns the IP mask (in 4-byte form) of the
        IPv4 mask a.b.c.d.
    **/
    @:native("IPv4Mask") static function iPv4Mask(a: go.Byte, b: go.Byte, c: go.Byte, d: go.Byte): (go.net.IPMask);
    /**
        InterfaceAddrs returns a list of the system's unicast interface
        addresses.
        
        The returned list does not identify the associated interface; use
        Interfaces and [Interface.Addrs] for more detail.
    **/
    @:native("InterfaceAddrs") static function interfaceAddrs(): (go.Result<go.Slice<go.net.Addr>>);
    /**
        InterfaceByIndex returns the interface specified by index.
        
        On Solaris, it returns one of the logical network interfaces
        sharing the logical data link; for more precision use
        [InterfaceByName].
    **/
    @:native("InterfaceByIndex") static function interfaceByIndex(index: go.GoInt): (go.Result<go.Pointer<go.net.Interface>>);
    /**
        InterfaceByName returns the interface specified by name.
    **/
    @:native("InterfaceByName") static function interfaceByName(name: String): (go.Result<go.Pointer<go.net.Interface>>);
    /**
        Interfaces returns a list of the system's network interfaces.
    **/
    @:native("Interfaces") static function interfaces(): (go.Result<go.Slice<go.net.Interface>>);
    /**
        JoinHostPort combines host and port into a network address of the
        form "host:port". If host contains a colon, as found in literal
        IPv6 addresses, then JoinHostPort returns "[host]:port".
        
        See func Dial for a description of the host and port parameters.
    **/
    @:native("JoinHostPort") static function joinHostPort(host: String, port: String): (String);
    /**
        Listen announces on the local network address.
        
        The network must be "tcp", "tcp4", "tcp6", "unix" or "unixpacket".
        
        For TCP networks, if the host in the address parameter is empty or
        a literal unspecified IP address, Listen listens on all available
        unicast and anycast IP addresses of the local system.
        To only use IPv4, use network "tcp4".
        The address can use a host name, but this is not recommended,
        because it will create a listener for at most one of the host's IP
        addresses.
        If the port in the address parameter is empty or "0", as in
        "127.0.0.1:" or "[::1]:0", a port number is automatically chosen.
        The [Addr] method of [Listener] can be used to discover the chosen
        port.
        
        See func [Dial] for a description of the network and address
        parameters.
        
        Listen uses context.Background internally; to specify the context, use
        [ListenConfig.Listen].
    **/
    @:native("Listen") static function listen(network: String, address: String): (go.Result<go.net.Listener>);
    /**
        ListenIP acts like [ListenPacket] for IP networks.
        
        The network must be an IP network name; see func Dial for details.
        
        If the IP field of laddr is nil or an unspecified IP address,
        ListenIP listens on all available IP addresses of the local system
        except multicast IP addresses.
    **/
    @:native("ListenIP") static function listenIP(network: String, laddr: go.Pointer<go.net.IPAddr>): (go.Result<go.Pointer<go.net.IPConn>>);
    /**
        ListenMulticastUDP acts like [ListenPacket] for UDP networks but
        takes a group address on a specific network interface.
        
        The network must be a UDP network name; see func [Dial] for details.
        
        ListenMulticastUDP listens on all available IP addresses of the
        local system including the group, multicast IP address.
        If ifi is nil, ListenMulticastUDP uses the system-assigned
        multicast interface, although this is not recommended because the
        assignment depends on platforms and sometimes it might require
        routing configuration.
        If the Port field of gaddr is 0, a port number is automatically
        chosen.
        
        ListenMulticastUDP is just for convenience of simple, small
        applications. There are [golang.org/x/net/ipv4] and
        [golang.org/x/net/ipv6] packages for general purpose uses.
        
        Note that ListenMulticastUDP will set the IP_MULTICAST_LOOP socket option
        to 0 under IPPROTO_IP, to disable loopback of multicast packets.
    **/
    @:native("ListenMulticastUDP") static function listenMulticastUDP(network: String, ifi: go.Pointer<go.net.Interface>, gaddr: go.Pointer<go.net.UDPAddr>): (go.Result<go.Pointer<go.net.UDPConn>>);
    /**
        ListenPacket announces on the local network address.
        
        The network must be "udp", "udp4", "udp6", "unixgram", or an IP
        transport. The IP transports are "ip", "ip4", or "ip6" followed by
        a colon and a literal protocol number or a protocol name, as in
        "ip:1" or "ip:icmp".
        
        For UDP and IP networks, if the host in the address parameter is
        empty or a literal unspecified IP address, ListenPacket listens on
        all available IP addresses of the local system except multicast IP
        addresses.
        To only use IPv4, use network "udp4" or "ip4:proto".
        The address can use a host name, but this is not recommended,
        because it will create a listener for at most one of the host's IP
        addresses.
        If the port in the address parameter is empty or "0", as in
        "127.0.0.1:" or "[::1]:0", a port number is automatically chosen.
        The LocalAddr method of [PacketConn] can be used to discover the
        chosen port.
        
        See func [Dial] for a description of the network and address
        parameters.
        
        ListenPacket uses context.Background internally; to specify the context, use
        [ListenConfig.ListenPacket].
    **/
    @:native("ListenPacket") static function listenPacket(network: String, address: String): (go.Result<go.net.PacketConn>);
    /**
        ListenTCP acts like [Listen] for TCP networks.
        
        The network must be a TCP network name; see func Dial for details.
        
        If the IP field of laddr is nil or an unspecified IP address,
        ListenTCP listens on all available unicast and anycast IP addresses
        of the local system.
        If the Port field of laddr is 0, a port number is automatically
        chosen.
    **/
    @:native("ListenTCP") static function listenTCP(network: String, laddr: go.Pointer<go.net.TCPAddr>): (go.Result<go.Pointer<go.net.TCPListener>>);
    /**
        ListenUDP acts like [ListenPacket] for UDP networks.
        
        The network must be a UDP network name; see func [Dial] for details.
        
        If the IP field of laddr is nil or an unspecified IP address,
        ListenUDP listens on all available IP addresses of the local system
        except multicast IP addresses.
        If the Port field of laddr is 0, a port number is automatically
        chosen.
    **/
    @:native("ListenUDP") static function listenUDP(network: String, laddr: go.Pointer<go.net.UDPAddr>): (go.Result<go.Pointer<go.net.UDPConn>>);
    /**
        ListenUnix acts like [Listen] for Unix networks.
        
        The network must be "unix" or "unixpacket".
    **/
    @:native("ListenUnix") static function listenUnix(network: String, laddr: go.Pointer<go.net.UnixAddr>): (go.Result<go.Pointer<go.net.UnixListener>>);
    /**
        ListenUnixgram acts like [ListenPacket] for Unix networks.
        
        The network must be "unixgram".
    **/
    @:native("ListenUnixgram") static function listenUnixgram(network: String, laddr: go.Pointer<go.net.UnixAddr>): (go.Result<go.Pointer<go.net.UnixConn>>);
    /**
        LookupAddr performs a reverse lookup for the given address, returning a list
        of names mapping to that address.
        
        The returned names are validated to be properly formatted presentation-format
        domain names. If the response contains invalid names, those records are filtered
        out and an error will be returned alongside the remaining results, if any.
        
        When using the host C library resolver, at most one result will be
        returned. To bypass the host resolver, use a custom [Resolver].
        
        LookupAddr uses [context.Background] internally; to specify the context, use
        [Resolver.LookupAddr].
    **/
    @:native("LookupAddr") static function lookupAddr(addr: String): (go.Result<go.Slice<String>>);
    /**
        LookupCNAME returns the canonical name for the given host.
        Callers that do not care about the canonical name can call
        [LookupHost] or [LookupIP] directly; both take care of resolving
        the canonical name as part of the lookup.
        
        A canonical name is the final name after following zero
        or more CNAME records.
        LookupCNAME does not return an error if host does not
        contain DNS "CNAME" records, as long as host resolves to
        address records.
        
        The returned canonical name is validated to be a properly
        formatted presentation-format domain name.
        
        LookupCNAME uses [context.Background] internally; to specify the context, use
        [Resolver.LookupCNAME].
    **/
    @:native("LookupCNAME") static function lookupCNAME(host: String): (go.Result<String>);
    /**
        LookupHost looks up the given host using the local resolver.
        It returns a slice of that host's addresses.
        
        LookupHost uses [context.Background] internally; to specify the context, use
        [Resolver.LookupHost].
    **/
    @:native("LookupHost") static function lookupHost(host: String): (go.Result<go.Slice<String>>);
    /**
        LookupIP looks up host using the local resolver.
        It returns a slice of that host's IPv4 and IPv6 addresses.
    **/
    @:native("LookupIP") static function lookupIP(host: String): (go.Result<go.Slice<go.net.IP>>);
    /**
        LookupMX returns the DNS MX records for the given domain name sorted by preference.
        
        The returned mail server names are validated to be properly
        formatted presentation-format domain names, or numeric IP addresses.
        If the response contains invalid names, those records are filtered out
        and an error will be returned alongside the remaining results, if any.
        
        LookupMX uses [context.Background] internally; to specify the context, use
        [Resolver.LookupMX].
    **/
    @:native("LookupMX") static function lookupMX(name: String): (go.Result<go.Slice<go.Pointer<go.net.MX>>>);
    /**
        LookupNS returns the DNS NS records for the given domain name.
        
        The returned name server names are validated to be properly
        formatted presentation-format domain names. If the response contains
        invalid names, those records are filtered out and an error
        will be returned alongside the remaining results, if any.
        
        LookupNS uses [context.Background] internally; to specify the context, use
        [Resolver.LookupNS].
    **/
    @:native("LookupNS") static function lookupNS(name: String): (go.Result<go.Slice<go.Pointer<go.net.NS>>>);
    /**
        LookupPort looks up the port for the given network and service.
        
        LookupPort uses [context.Background] internally; to specify the context, use
        [Resolver.LookupPort].
    **/
    @:native("LookupPort") static function lookupPort(network: String, service: String): (go.Result<go.GoInt>);
    /**
        LookupSRV tries to resolve an [SRV] query of the given service,
        protocol, and domain name. The proto is "tcp" or "udp".
        The returned records are sorted by priority and randomized
        by weight within a priority.
        
        LookupSRV constructs the DNS name to look up following RFC 2782.
        That is, it looks up _service._proto.name. To accommodate services
        publishing SRV records under non-standard names, if both service
        and proto are empty strings, LookupSRV looks up name directly.
        
        The returned service names are validated to be properly
        formatted presentation-format domain names. If the response contains
        invalid names, those records are filtered out and an error
        will be returned alongside the remaining results, if any.
    **/
    @:go.Tuple("cname", "addrs", "err") @:native("LookupSRV") static function lookupSRV(service: String, proto: String, name: String): (go.Tuple<{ cname: String, addrs: go.Slice<go.Pointer<go.net.SRV>>, err: go.Error }>);
    /**
        LookupTXT returns the DNS TXT records for the given domain name.
        
        If a DNS TXT record holds multiple strings, they are concatenated as a
        single string.
        
        LookupTXT uses [context.Background] internally; to specify the context, use
        [Resolver.LookupTXT].
    **/
    @:native("LookupTXT") static function lookupTXT(name: String): (go.Result<go.Slice<String>>);
    /**
        ParseCIDR parses s as a CIDR notation IP address and prefix length,
        like "192.0.2.0/24" or "2001:db8::/32", as defined in
        RFC 4632 and RFC 4291.
        
        It returns the IP address and the network implied by the IP and
        prefix length.
        For example, ParseCIDR("192.0.2.1/24") returns the IP address
        192.0.2.1 and the network 192.0.2.0/24.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("ParseCIDR") static function parseCIDR(s: String): (go.Tuple<{ p0: go.net.IP, p1: go.Pointer<go.net.IPNet>, p2: go.Error }>);
    /**
        ParseIP parses s as an IP address, returning the result.
        The string s can be in IPv4 dotted decimal ("192.0.2.1"), IPv6
        ("2001:db8::68"), or IPv4-mapped IPv6 ("::ffff:192.0.2.1") form.
        If s is not a valid textual representation of an IP address,
        ParseIP returns nil. The returned address is always 16 bytes,
        IPv4 addresses are returned in IPv4-mapped IPv6 form.
    **/
    @:native("ParseIP") static function parseIP(s: String): (go.net.IP);
    /**
        ParseMAC parses s as an IEEE 802 MAC-48, EUI-48, EUI-64, or a 20-octet
        IP over InfiniBand link-layer address using one of the following formats:
        
        	00:00:5e:00:53:01
        	02:00:5e:10:00:00:00:01
        	00:00:00:00:fe:80:00:00:00:00:00:00:02:00:5e:10:00:00:00:01
        	00-00-5e-00-53-01
        	02-00-5e-10-00-00-00-01
        	00-00-00-00-fe-80-00-00-00-00-00-00-02-00-5e-10-00-00-00-01
        	0000.5e00.5301
        	0200.5e10.0000.0001
        	0000.0000.fe80.0000.0000.0000.0200.5e10.0000.0001
        	00005e005301
    **/
    @:native("ParseMAC") static function parseMAC(s: String): (go.Result<go.net.HardwareAddr>);
    /**
        Pipe creates a synchronous, in-memory, full duplex
        network connection; both ends implement the [Conn] interface.
        Reads on one end are matched with writes on the other,
        copying data directly between the two; there is no internal
        buffering.
    **/
    @:go.Tuple("p0", "p1") @:native("Pipe") static function pipe(): (go.Tuple<{ p0: go.net.Conn, p1: go.net.Conn }>);
    /**
        ResolveIPAddr returns an address of IP end point.
        
        The network must be an IP network name.
        
        If the host in the address parameter is not a literal IP address,
        ResolveIPAddr resolves the address to an address of IP end point.
        Otherwise, it parses the address as a literal IP address.
        The address parameter can use a host name, but this is not
        recommended, because it will return at most one of the host name's
        IP addresses.
        
        See func [Dial] for a description of the network and address
        parameters.
    **/
    @:native("ResolveIPAddr") static function resolveIPAddr(network: String, address: String): (go.Result<go.Pointer<go.net.IPAddr>>);
    /**
        ResolveTCPAddr returns an address of TCP end point.
        
        The network must be a TCP network name.
        
        If the host in the address parameter is not a literal IP address or
        the port is not a literal port number, ResolveTCPAddr resolves the
        address to an address of TCP end point.
        Otherwise, it parses the address as a pair of literal IP address
        and port number.
        The address parameter can use a host name, but this is not
        recommended, because it will return at most one of the host name's
        IP addresses.
        
        See func [Dial] for a description of the network and address
        parameters.
    **/
    @:native("ResolveTCPAddr") static function resolveTCPAddr(network: String, address: String): (go.Result<go.Pointer<go.net.TCPAddr>>);
    /**
        ResolveUDPAddr returns an address of UDP end point.
        
        The network must be a UDP network name.
        
        If the host in the address parameter is not a literal IP address or
        the port is not a literal port number, ResolveUDPAddr resolves the
        address to an address of UDP end point.
        Otherwise, it parses the address as a pair of literal IP address
        and port number.
        The address parameter can use a host name, but this is not
        recommended, because it will return at most one of the host name's
        IP addresses.
        
        See func [Dial] for a description of the network and address
        parameters.
    **/
    @:native("ResolveUDPAddr") static function resolveUDPAddr(network: String, address: String): (go.Result<go.Pointer<go.net.UDPAddr>>);
    /**
        ResolveUnixAddr returns an address of Unix domain socket end point.
        
        The network must be a Unix network name.
        
        See func [Dial] for a description of the network and address
        parameters.
    **/
    @:native("ResolveUnixAddr") static function resolveUnixAddr(network: String, address: String): (go.Result<go.Pointer<go.net.UnixAddr>>);
    /**
        SplitHostPort splits a network address of the form "host:port",
        "host%zone:port", "[host]:port" or "[host%zone]:port" into host or
        host%zone and port.
        
        A literal IPv6 address in hostport must be enclosed in square
        brackets, as in "[::1]:80", "[::1%lo0]:80".
        
        See func Dial for a description of the hostport parameter, and host
        and port results.
    **/
    @:go.Tuple("host", "port", "err") @:native("SplitHostPort") static function splitHostPort(hostport: String): (go.Tuple<{ host: String, port: String, err: go.Error }>);
    /**
        TCPAddrFromAddrPort returns addr as a [TCPAddr]. If addr.IsValid() is false,
        then the returned TCPAddr will contain a nil IP field, indicating an
        address family-agnostic unspecified address.
    **/
    @:native("TCPAddrFromAddrPort") static function tCPAddrFromAddrPort(addr: go.net.netip.AddrPort): (go.Pointer<go.net.TCPAddr>);
    /**
        UDPAddrFromAddrPort returns addr as a [UDPAddr]. If addr.IsValid() is false,
        then the returned UDPAddr will contain a nil IP field, indicating an
        address family-agnostic unspecified address.
    **/
    @:native("UDPAddrFromAddrPort") static function uDPAddrFromAddrPort(addr: go.net.netip.AddrPort): (go.Pointer<go.net.UDPAddr>);

}