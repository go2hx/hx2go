package go.net;

@:go.Type({ name: "Flags", instanceName: "net.Flags", imports: ["net"] })
extern typedef Flags = haxe.extern.EitherType<go.GoUInt, {
    @:native("String") function string(): (String);

}>