package go.debug.macho;

@:go.Type({ name: "LoadCmd", instanceName: "macho.LoadCmd", imports: ["debug/macho"] })
extern typedef LoadCmd = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>