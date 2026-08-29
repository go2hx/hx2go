package go.debug.elf;

/**
    Relocation types for LoongArch.
**/
@:go.Type({ name: "R_LARCH", instanceName: "elf.R_LARCH", imports: ["debug/elf"] })
extern typedef R_LARCH = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>