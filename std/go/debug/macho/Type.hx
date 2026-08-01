package go.debug.macho;

@:go.Type({ name: "Type", instanceName: "macho.Type", imports: ["debug/macho"] })
extern typedef Type = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>