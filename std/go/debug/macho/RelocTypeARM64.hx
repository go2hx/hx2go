package go.debug.macho;

@:go.Type({ name: "RelocTypeARM64", instanceName: "macho.RelocTypeARM64", imports: ["debug/macho"] })
extern typedef RelocTypeARM64 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>