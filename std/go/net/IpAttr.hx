package go.net;

@:structInit
@:go.Type({ name: "ipAttr", instanceName: "net.ipAttr", imports: ["net"] })
extern class IpAttr {

    @:native("Scope") var scope: go.net.Scope;
    @:native("Precedence") var precedence: go.UInt8;
    @:native("Label") var label: go.UInt8;

    function new(scope: go.net.Scope=cast 0, precedence: go.UInt8=0, label: go.UInt8=0);

}