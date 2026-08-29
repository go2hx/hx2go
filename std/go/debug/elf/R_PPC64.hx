package go.debug.elf;

/**
    Relocation types for 64-bit PowerPC or Power Architecture processors.
    
    Values that are shared by both R_PPC and R_PPC64 are prefixed with
    R_POWERPC_ in the ELF standard. For the R_PPC64 type, the relevant
    shared relocations have been renamed with the prefix R_PPC64_.
    The original name follows the value in a comment.
**/
@:go.Type({ name: "R_PPC64", instanceName: "elf.R_PPC64", imports: ["debug/elf"] })
extern typedef R_PPC64 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>