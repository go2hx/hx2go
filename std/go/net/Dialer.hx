package go.net;

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
    @:native("Control") var control: (network: String, address: String, c: go.syscall.RawConn) -> go.Error;
    @:native("ControlContext") var controlContext: (ctx: go.context.Context, network: String, address: String, c: go.syscall.RawConn) -> go.Error;

function new(timeout: go.time.Duration, deadline: go.time.Time, localAddr: go.net.Addr, dualStack: Bool, fallbackDelay: go.time.Duration, keepAlive: go.time.Duration, keepAliveConfig: go.net.KeepAliveConfig, resolver: go.Pointer<go.net.Resolver>, cancel: go.Chan<Dynamic>, control: (network: String, address: String, c: go.syscall.RawConn) -> go.Error, controlContext: (ctx: go.context.Context, network: String, address: String, c: go.syscall.RawConn) -> go.Error);

    @:native("Dial") function dial(network: String, address: String): go.Result<go.net.Conn>;
    @:native("DialContext") function dialContext(ctx: go.context.Context, network: String, address: String): go.Result<go.net.Conn>;
    @:native("DialIP") function dialIP(ctx: go.context.Context, network: String, laddr: go.net.netip.Addr, raddr: go.net.netip.Addr): go.Result<go.Pointer<go.net.IPConn>>;
    @:native("DialTCP") function dialTCP(ctx: go.context.Context, network: String, laddr: go.net.netip.AddrPort, raddr: go.net.netip.AddrPort): go.Result<go.Pointer<go.net.TCPConn>>;
    @:native("DialUDP") function dialUDP(ctx: go.context.Context, network: String, laddr: go.net.netip.AddrPort, raddr: go.net.netip.AddrPort): go.Result<go.Pointer<go.net.UDPConn>>;
    @:native("DialUnix") function dialUnix(ctx: go.context.Context, network: String, laddr: go.Pointer<go.net.UnixAddr>, raddr: go.Pointer<go.net.UnixAddr>): go.Result<go.Pointer<go.net.UnixConn>>;
    @:native("MultipathTCP") function multipathTCP(): Bool;
    @:native("SetMultipathTCP") function setMultipathTCP(use: Bool): Void;

}