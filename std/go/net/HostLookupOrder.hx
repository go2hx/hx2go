package go.net;

@:go.Type({ name: "hostLookupOrder", instanceName: "net.hostLookupOrder", imports: ["net"] })
extern typedef HostLookupOrder = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>