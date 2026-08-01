package go.debug.macho;

@:go.Type({ name: "RelocTypeX86_64", instanceName: "macho.RelocTypeX86_64", imports: ["debug/macho"] })
extern typedef RelocTypeX86_64 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>