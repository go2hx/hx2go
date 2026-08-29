package go.net;

/**
    TCPAddr represents the address of a TCP end point.
**/
@:structInit
@:go.Type({ name: "TCPAddr", instanceName: "net.TCPAddr", imports: ["net"] })
extern class TCPAddr {

    @:native("IP") var IP: go.net.IP;
    @:native("Port") var port: go.GoInt;
    @:native("Zone") var zone: String;

    function new(IP: go.net.IP=null, port: go.GoInt=0, zone: String="");

    /**
        AddrPort returns the [TCPAddr] a as a [netip.AddrPort].
        
        If a.Port does not fit in a uint16, it's silently truncated.
        
        If a is nil, a zero value is returned.
    **/
    @:native("AddrPort") function addrPort(): (go.net.netip.AddrPort);
    /**
        Network returns the address's network name, "tcp".
    **/
    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}