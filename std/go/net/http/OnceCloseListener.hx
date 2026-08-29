package go.net.http;

@:structInit
@:go.Type({ name: "onceCloseListener", instanceName: "http.onceCloseListener", imports: ["net/http"] })
extern class OnceCloseListener {

    @:native("Listener") var listener: go.net.Listener;

    function new(listener: go.net.Listener=null);

    @:native("Accept") function accept(): (go.Result<go.net.Conn>);
    @:native("Addr") function addr(): (go.net.Addr);
    @:native("Close") function close(): (go.Error);

}