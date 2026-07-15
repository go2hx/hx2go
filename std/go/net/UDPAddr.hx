package go.net;

@:structInit
@:go.Type({ name: "UDPAddr", instanceName: "net.UDPAddr", imports: ["net"] })
extern class UDPAddr {

    @:native("IP") var IP: go.net.IP;
    @:native("Port") var port: go.GoInt;
    @:native("Zone") var zone: String;

function new(IP: go.net.IP, port: go.GoInt, zone: String);

    @:native("AddrPort") function addrPort(): go.net.netip.AddrPort;
    @:native("Network") function network(): String;
    @:native("String") function string(): String;

}