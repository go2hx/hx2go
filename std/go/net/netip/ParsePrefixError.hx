package go.net.netip;

@:structInit
@:go.Type({ name: "parsePrefixError", instanceName: "netip.parsePrefixError", imports: ["net/netip"] })
extern class ParsePrefixError {

    @:native("Error") function error(): (String);

}