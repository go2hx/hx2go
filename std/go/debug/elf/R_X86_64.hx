package go.debug.elf;

@:go.Type({ name: "R_X86_64", instanceName: "elf.R_X86_64", imports: ["debug/elf"] })
extern typedef R_X86_64 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>