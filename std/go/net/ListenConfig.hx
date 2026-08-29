package go.net;

/**
    ListenConfig contains options for listening to an address.
**/
@:structInit
@:go.Type({ name: "ListenConfig", instanceName: "net.ListenConfig", imports: ["net"] })
extern class ListenConfig {

    @:native("Control") var control: (network: String, address: String, c: go.syscall.RawConn) -> (go.Error);
    @:native("KeepAlive") var keepAlive: go.time.Duration;
    @:native("KeepAliveConfig") var keepAliveConfig: go.net.KeepAliveConfig;

    function new(control: (network: String, address: String, c: go.syscall.RawConn) -> (go.Error)=null, keepAlive: go.time.Duration=cast 0, keepAliveConfig: go.net.KeepAliveConfig);

    /**
        Listen announces on the local network address.
        
        See func Listen for a description of the network and address
        parameters.
        
        The ctx argument is used while resolving the address on which to listen;
        it does not affect the returned Listener.
    **/
    @:native("Listen") function listen(ctx: go.context.Context, network: String, address: String): (go.Result<go.net.Listener>);
    /**
        ListenPacket announces on the local network address.
        
        See func ListenPacket for a description of the network and address
        parameters.
        
        The ctx argument is used while resolving the address on which to listen;
        it does not affect the returned PacketConn.
    **/
    @:native("ListenPacket") function listenPacket(ctx: go.context.Context, network: String, address: String): (go.Result<go.net.PacketConn>);
    /**
        MultipathTCP reports whether MPTCP will be used.
        
        This method doesn't check if MPTCP is supported by the operating
        system or not.
    **/
    @:native("MultipathTCP") function multipathTCP(): (Bool);
    /**
        SetMultipathTCP directs the [Listen] method to use, or not use, MPTCP,
        if supported by the operating system. This method overrides the
        system default and the GODEBUG=multipathtcp=... setting if any.
        
        If MPTCP is not available on the host or not supported by the client,
        the Listen method will fall back to TCP.
    **/
    @:native("SetMultipathTCP") function setMultipathTCP(use: Bool): Void;

}