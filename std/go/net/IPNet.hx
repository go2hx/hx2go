package go.net;

@:structInit
@:go.Type({ name: "IPNet", instanceName: "net.IPNet", imports: ["net"] })
extern class IPNet {

    @:native("IP") var IP: go.net.IP;
    @:native("Mask") var mask: go.net.IPMask;

function new(IP: go.net.IP, mask: go.net.IPMask);

    @:native("Contains") function contains(ip: go.net.IP): Bool;
    @:native("Network") function network(): String;
    @:native("String") function string(): String;

}