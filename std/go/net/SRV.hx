package go.net;

/**
    An SRV represents a single DNS SRV record.
**/
@:structInit
@:go.Type({ name: "SRV", instanceName: "net.SRV", imports: ["net"] })
extern class SRV {

    @:native("Target") var target: String;
    @:native("Port") var port: go.UInt16;
    @:native("Priority") var priority: go.UInt16;
    @:native("Weight") var weight: go.UInt16;

    function new(target: String="", port: go.UInt16=0, priority: go.UInt16=0, weight: go.UInt16=0);

}