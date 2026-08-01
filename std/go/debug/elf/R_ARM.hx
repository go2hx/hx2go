package go.debug.elf;

@:go.Type({ name: "R_ARM", instanceName: "elf.R_ARM", imports: ["debug/elf"] })
extern typedef R_ARM = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>