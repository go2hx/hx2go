package go.net;

@:structInit
@:go.Type({ name: "MX", instanceName: "net.MX", imports: ["net"] })
extern class MX {

    @:native("Host") var host: String;
    @:native("Pref") var pref: go.UInt16;

function new(host: String, pref: go.UInt16);

}