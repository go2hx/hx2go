package go.debug.elf;

/**
    Relocation types for s390x processors.
**/
@:go.Type({ name: "R_390", instanceName: "elf.R_390", imports: ["debug/elf"] })
extern typedef R_390 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>