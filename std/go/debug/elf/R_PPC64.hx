package go.debug.elf;

@:go.Type({ name: "R_PPC64", instanceName: "elf.R_PPC64", imports: ["debug/elf"] })
extern typedef R_PPC64 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>