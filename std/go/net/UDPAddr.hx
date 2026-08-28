package go.net;

/**
    UDPAddr represents the address of a UDP end point.
**/
@:structInit
@:go.Type({ name: "UDPAddr", instanceName: "net.UDPAddr", imports: ["net"] })
extern class UDPAddr {

    @:native("IP") var IP: go.net.IP;
    @:native("Port") var port: go.GoInt;
    @:native("Zone") var zone: String;

    function new(IP: go.net.IP=null, port: go.GoInt=0, zone: String="");

    /**
        AddrPort returns the [UDPAddr] a as a [netip.AddrPort].
        
        If a.Port does not fit in a uint16, it's silently truncated.
        
        If a is nil, a zero value is returned.
    **/
    @:native("AddrPort") function addrPort(): (go.net.netip.AddrPort);
    /**
        Network returns the address's network name, "udp".
    **/
    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}