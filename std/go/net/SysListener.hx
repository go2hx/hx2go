package go.net;

@:structInit
@:go.Type({ name: "sysListener", instanceName: "net.sysListener", imports: ["net"] })
extern class SysListener {

    @:native("ListenConfig") var listenConfig: go.net.ListenConfig;
    @:native("Control") var control: (network: String, address: String, c: go.syscall.RawConn) -> (go.Error);
    @:native("KeepAlive") var keepAlive: go.time.Duration;
    @:native("KeepAliveConfig") var keepAliveConfig: go.net.KeepAliveConfig;

    function new(listenConfig: go.net.ListenConfig);

    @:native("Listen") function listen(ctx: go.context.Context, network: String, address: String): (go.Result<go.net.Listener>);
    @:native("ListenPacket") function listenPacket(ctx: go.context.Context, network: String, address: String): (go.Result<go.net.PacketConn>);
    @:native("MultipathTCP") function multipathTCP(): (Bool);
    @:native("SetMultipathTCP") function setMultipathTCP(use: Bool): Void;

}