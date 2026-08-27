package go.net;

@:structInit
@:go.Type({ name: "policyTableEntry", instanceName: "net.policyTableEntry", imports: ["net"] })
extern class PolicyTableEntry {

    @:native("Prefix") var prefix: go.net.netip.Prefix;
    @:native("Precedence") var precedence: go.UInt8;
    @:native("Label") var label: go.UInt8;

    function new(prefix: go.net.netip.Prefix, precedence: go.UInt8=0, label: go.UInt8=0);

}