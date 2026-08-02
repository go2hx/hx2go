package go.debug.macho;

@:go.Type({ name: "RelocTypeGeneric", instanceName: "macho.RelocTypeGeneric", imports: ["debug/macho"] })
extern typedef RelocTypeGeneric = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>