package go.net.http.httptrace;

@:structInit
@:go.Type({ name: "DNSDoneInfo", instanceName: "httptrace.DNSDoneInfo", imports: ["net/http/httptrace"] })
extern class DNSDoneInfo {

    @:native("Addrs") var addrs: go.Slice<go.net.IPAddr>;
    @:native("Err") var err: go.Error;
    @:native("Coalesced") var coalesced: Bool;

function new(addrs: go.Slice<go.net.IPAddr>, err: go.Error, coalesced: Bool);

}