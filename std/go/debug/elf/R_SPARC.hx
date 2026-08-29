package go.debug.elf;

/**
    Relocation types for SPARC.
**/
@:go.Type({ name: "R_SPARC", instanceName: "elf.R_SPARC", imports: ["debug/elf"] })
extern typedef R_SPARC = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>