package go.debug.elf;

@:go.Type({ name: "R_MIPS", instanceName: "elf.R_MIPS", imports: ["debug/elf"] })
extern typedef R_MIPS = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>