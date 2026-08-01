package go.net;

@:structInit
@:go.Type({ name: "ipStackCapabilities", instanceName: "net.ipStackCapabilities", imports: ["net"] })
extern class IpStackCapabilities {

    @:native("Once") var once: go.sync.Once;

    function new(once: go.sync.Once);

    @:native("Do") function _do(f: () -> Void): Void;

}