package go.net;

@:structInit
@:go.Type({ name: "IPAddr", instanceName: "net.IPAddr", imports: ["net"] })
extern class IPAddr {

    @:native("IP") var IP: go.net.IP;
    @:native("Zone") var zone: String;

function new(IP: go.net.IP, zone: String);

    @:native("Network") function network(): String;
    @:native("String") function string(): String;

}