package go.crypto.tls;

@:structInit
@:go.Type({ name: "listener", instanceName: "tls.listener", imports: ["crypto/tls"] })
extern class Listener {

    @:native("Listener") var listener: go.net.Listener;

    function new(listener: go.net.Listener);

    @:native("Accept") function accept(): (go.Result<go.net.Conn>);
    @:native("Addr") function addr(): (go.net.Addr);
    @:native("Close") function close(): (go.Error);

}