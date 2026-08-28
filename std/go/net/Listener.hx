package go.net;

/**
    A Listener is a generic network listener for stream-oriented protocols.
    
    Multiple goroutines may invoke methods on a Listener simultaneously.
**/
@:go.Type({ name: "Listener", instanceName: "net.Listener", imports: ["net"] })
extern typedef Listener = {

    @:native("Accept") function accept(): (go.Result<go.net.Conn>);
    @:native("Addr") function addr(): (go.net.Addr);
    @:native("Close") function close(): (go.Error);

}