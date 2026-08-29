package go.debug.elf;

/**
    Relocation types for PowerPC.
    
    Values that are shared by both R_PPC and R_PPC64 are prefixed with
    R_POWERPC_ in the ELF standard. For the R_PPC type, the relevant
    shared relocations have been renamed with the prefix R_PPC_.
    The original name follows the value in a comment.
**/
@:go.Type({ name: "R_PPC", instanceName: "elf.R_PPC", imports: ["debug/elf"] })
extern typedef R_PPC = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>