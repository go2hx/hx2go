package go.net;

/**
    A Dialer contains options for connecting to an address.
    
    The zero value for each field is equivalent to dialing
    without that option. Dialing with the zero value of Dialer
    is therefore equivalent to just calling the [Dial] function.
    
    It is safe to call Dialer's methods concurrently.
**/
@:structInit
@:go.Type({ name: "Dialer", instanceName: "net.Dialer", imports: ["net"] })
extern class Dialer {

    @:native("Timeout") var timeout: go.time.Duration;
    @:native("Deadline") var deadline: go.time.Time;
    @:native("LocalAddr") var localAddr: go.net.Addr;
    @:native("DualStack") var dualStack: Bool;
    @:native("FallbackDelay") var fallbackDelay: go.time.Duration;
    @:native("KeepAlive") var keepAlive: go.time.Duration;
    @:native("KeepAliveConfig") var keepAliveConfig: go.net.KeepAliveConfig;
    @:native("Resolver") var resolver: go.Pointer<go.net.Resolver>;
    @:native("Cancel") var cancel: go.Chan<Dynamic>;
    @:native("Control") var control: (network: String, address: String, c: go.syscall.RawConn) -> (go.Error);
    @:native("ControlContext") var controlContext: (ctx: go.context.Context, network: String, address: String, c: go.syscall.RawConn) -> (go.Error);

    function new(timeout: go.time.Duration=cast 0, deadline: go.time.Time, localAddr: go.net.Addr=null, dualStack: Bool=false, fallbackDelay: go.time.Duration=cast 0, keepAlive: go.time.Duration=cast 0, keepAliveConfig: go.net.KeepAliveConfig, resolver: go.Pointer<go.net.Resolver>=null, cancel: go.Chan<Dynamic>=null, control: (network: String, address: String, c: go.syscall.RawConn) -> (go.Error)=null, controlContext: (ctx: go.context.Context, network: String, address: String, c: go.syscall.RawConn) -> (go.Error)=null);

    /**
        Dial connects to the address on the named network.
        
        See func Dial for a description of the network and address
        parameters.
        
        Dial uses [context.Background] internally; to specify the context, use
        [Dialer.DialContext].
    **/
    @:native("Dial") function dial(network: String, address: String): (go.Result<go.net.Conn>);
    /**
        DialContext connects to the address on the named network using
        the provided context.
        
        The provided Context must be non-nil. If the context expires before
        the connection is complete, an error is returned. Once successfully
        connected, any expiration of the context will not affect the
        connection.
        
        When using TCP, and the host in the address parameter resolves to multiple
        network addresses, any dial timeout (from d.Timeout or ctx) is spread
        over each consecutive dial, such that each is given an appropriate
        fraction of the time to connect.
        For example, if a host has 4 IP addresses and the timeout is 1 minute,
        the connect to each single address will be given 15 seconds to complete
        before trying the next one.
        
        See func [Dial] for a description of the network and address
        parameters.
    **/
    @:native("DialContext") function dialContext(ctx: go.context.Context, network: String, address: String): (go.Result<go.net.Conn>);
    /**
        DialIP acts like Dial for IP networks using the provided context.
        
        The provided Context must be non-nil. If the context expires before
        the connection is complete, an error is returned. Once successfully
        connected, any expiration of the context will not affect the
        connection.
        
        The network must be an IP network name; see func Dial for details.
    **/
    @:native("DialIP") function dialIP(ctx: go.context.Context, network: String, laddr: go.net.netip.Addr, raddr: go.net.netip.Addr): (go.Result<go.Pointer<go.net.IPConn>>);
    /**
        DialTCP acts like Dial for TCP networks using the provided context.
        
        The provided Context must be non-nil. If the context expires before
        the connection is complete, an error is returned. Once successfully
        connected, any expiration of the context will not affect the
        connection.
        
        The network must be a TCP network name; see func Dial for details.
    **/
    @:native("DialTCP") function dialTCP(ctx: go.context.Context, network: String, laddr: go.net.netip.AddrPort, raddr: go.net.netip.AddrPort): (go.Result<go.Pointer<go.net.TCPConn>>);
    /**
        DialUDP acts like Dial for UDP networks using the provided context.
        
        The provided Context must be non-nil. If the context expires before
        the connection is complete, an error is returned. Once successfully
        connected, any expiration of the context will not affect the
        connection.
        
        The network must be a UDP network name; see func Dial for details.
    **/
    @:native("DialUDP") function dialUDP(ctx: go.context.Context, network: String, laddr: go.net.netip.AddrPort, raddr: go.net.netip.AddrPort): (go.Result<go.Pointer<go.net.UDPConn>>);
    /**
        DialUnix acts like Dial for Unix networks using the provided context.
        
        The provided Context must be non-nil. If the context expires before
        the connection is complete, an error is returned. Once successfully
        connected, any expiration of the context will not affect the
        connection.
        
        The network must be a Unix network name; see func Dial for details.
    **/
    @:native("DialUnix") function dialUnix(ctx: go.context.Context, network: String, laddr: go.Pointer<go.net.UnixAddr>, raddr: go.Pointer<go.net.UnixAddr>): (go.Result<go.Pointer<go.net.UnixConn>>);
    /**
        MultipathTCP reports whether MPTCP will be used.
        
        This method doesn't check if MPTCP is supported by the operating
        system or not.
    **/
    @:native("MultipathTCP") function multipathTCP(): (Bool);
    /**
        SetMultipathTCP directs the [Dial] methods to use, or not use, MPTCP,
        if supported by the operating system. This method overrides the
        system default and the GODEBUG=multipathtcp=... setting if any.
        
        If MPTCP is not available on the host or not supported by the server,
        the Dial methods will fall back to TCP.
    **/
    @:native("SetMultipathTCP") function setMultipathTCP(use: Bool): Void;

}