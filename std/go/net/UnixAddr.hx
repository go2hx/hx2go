package go.net;

@:structInit
@:go.Type({ name: "UnixAddr", instanceName: "net.UnixAddr", imports: ["net"] })
extern class UnixAddr {

    @:native("Name") var name: String;
    @:native("Net") var net: String;

function new(name: String, net: String);

    @:native("Network") function network(): String;
    @:native("String") function string(): String;

}