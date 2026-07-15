package go.internal.nettrace;

@:structInit
@:go.Type({ name: "Trace", instanceName: "nettrace.Trace", imports: ["internal/nettrace"] })
extern class Trace {

    @:native("DNSStart") var dNSStart: (name: String) -> Void;
    @:native("DNSDone") var dNSDone: (netIPs: go.Slice<Dynamic>, coalesced: Bool, err: go.Error) -> Void;
    @:native("ConnectStart") var connectStart: (network: String, addr: String) -> Void;
    @:native("ConnectDone") var connectDone: (network: String, addr: String, err: go.Error) -> Void;

function new(dNSStart: (name: String) -> Void, dNSDone: (netIPs: go.Slice<Dynamic>, coalesced: Bool, err: go.Error) -> Void, connectStart: (network: String, addr: String) -> Void, connectDone: (network: String, addr: String, err: go.Error) -> Void);

}