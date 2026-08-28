package go.net;

/**
    IPAddr represents the address of an IP end point.
**/
@:structInit
@:go.Type({ name: "IPAddr", instanceName: "net.IPAddr", imports: ["net"] })
extern class IPAddr {

    @:native("IP") var IP: go.net.IP;
    @:native("Zone") var zone: String;

    function new(IP: go.net.IP=null, zone: String="");

    /**
        Network returns the address's network name, "ip".
    **/
    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}