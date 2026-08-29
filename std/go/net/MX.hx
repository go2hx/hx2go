package go.net;

/**
    An MX represents a single DNS MX record.
**/
@:structInit
@:go.Type({ name: "MX", instanceName: "net.MX", imports: ["net"] })
extern class MX {

    @:native("Host") var host: String;
    @:native("Pref") var pref: go.UInt16;

    function new(host: String="", pref: go.UInt16=0);

}