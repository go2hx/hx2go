package go.net;

@:go.Type({ name: "policyTable", instanceName: "net.policyTable", imports: ["net"] })
extern class PolicyTable {

    @:native("Classify") function classify(ip: go.net.netip.Addr): (go.net.PolicyTableEntry);

}