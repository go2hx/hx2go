package go.net;

@:structInit
@:go.Type({ name: "ListenConfig", instanceName: "net.ListenConfig", imports: ["net"] })
extern class ListenConfig {

    @:native("Control") var control: (network: String, address: String, c: go.syscall.RawConn) -> go.Error;
    @:native("KeepAlive") var keepAlive: go.time.Duration;
    @:native("KeepAliveConfig") var keepAliveConfig: go.net.KeepAliveConfig;

function new(control: (network: String, address: String, c: go.syscall.RawConn) -> go.Error, keepAlive: go.time.Duration, keepAliveConfig: go.net.KeepAliveConfig);

    @:native("Listen") function listen(ctx: go.context.Context, network: String, address: String): go.Result<go.net.Listener>;
    @:native("ListenPacket") function listenPacket(ctx: go.context.Context, network: String, address: String): go.Result<go.net.PacketConn>;
    @:native("MultipathTCP") function multipathTCP(): Bool;
    @:native("SetMultipathTCP") function setMultipathTCP(use: Bool): Void;

}