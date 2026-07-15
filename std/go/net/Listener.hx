package go.net;

@:go.Type({ name: "Listener", instanceName: "net.Listener", imports: ["net"] })
extern typedef Listener = {

    @:native("Accept") function accept(): go.Result<go.net.Conn>;
    @:native("Addr") function addr(): go.net.Addr;
    @:native("Close") function close(): go.Error;

}