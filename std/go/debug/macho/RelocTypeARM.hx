package go.debug.macho;

@:go.Type({ name: "RelocTypeARM", instanceName: "macho.RelocTypeARM", imports: ["debug/macho"] })
extern typedef RelocTypeARM = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>