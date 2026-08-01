package go.debug.elf;

@:go.Type({ name: "R_AARCH64", instanceName: "elf.R_AARCH64", imports: ["debug/elf"] })
extern typedef R_AARCH64 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>