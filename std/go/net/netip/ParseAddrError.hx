package go.net.netip;

@:structInit
@:go.Type({ name: "parseAddrError", instanceName: "netip.parseAddrError", imports: ["net/netip"] })
extern class ParseAddrError {

    @:native("Error") function error(): (String);

}