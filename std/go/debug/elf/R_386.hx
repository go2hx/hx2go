package go.debug.elf;

@:go.Type({ name: "R_386", instanceName: "elf.R_386", imports: ["debug/elf"] })
extern typedef R_386 = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>