package go.net;

/**
    UnixAddr represents the address of a Unix domain socket end point.
    
    On Linux, a Name beginning with "@" denotes an abstract socket address:
    the "@" is translated to a NUL byte when the address is passed to the
    kernel, placing the socket in the abstract namespace rather than the
    filesystem. Abstract sockets are a Linux-specific feature; on other
    platforms, a Name beginning with "@" is treated as a literal filesystem
    path.
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