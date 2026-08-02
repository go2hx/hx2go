package go.debug.elf;

@:go.Type({ name: "R_PPC", instanceName: "elf.R_PPC", imports: ["debug/elf"] })
extern typedef R_PPC = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>