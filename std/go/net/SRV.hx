package go.net;

@:structInit
@:go.Type({ name: "SRV", instanceName: "net.SRV", imports: ["net"] })
extern class SRV {

    @:native("Target") var target: String;
    @:native("Port") var port: go.UInt16;
    @:native("Priority") var priority: go.UInt16;
    @:native("Weight") var weight: go.UInt16;

function new(target: String, port: go.UInt16, priority: go.UInt16, weight: go.UInt16);

}