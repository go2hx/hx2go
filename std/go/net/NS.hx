package go.net;

/**
    An NS represents a single DNS NS record.
**/
@:structInit
@:go.Type({ name: "NS", instanceName: "net.NS", imports: ["net"] })
extern class NS {

    @:native("Host") var host: String;

    function new(host: String="");

}