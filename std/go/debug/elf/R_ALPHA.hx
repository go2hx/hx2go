package go.debug.elf;

@:go.Type({ name: "R_ALPHA", instanceName: "elf.R_ALPHA", imports: ["debug/elf"] })
extern typedef R_ALPHA = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>