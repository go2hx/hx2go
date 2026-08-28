package go.net;

/**
    UnixAddr represents the address of a Unix domain socket end point.
**/
@:structInit
@:go.Type({ name: "UnixAddr", instanceName: "net.UnixAddr", imports: ["net"] })
extern class UnixAddr {

    @:native("Name") var name: String;
    @:native("Net") var net: String;

    function new(name: String="", net: String="");

    /**
        Network returns the address's network name, "unix", "unixgram" or
        "unixpacket".
    **/
    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}