package go.debug.elf;

@:go.Type({ name: "SymType", instanceName: "elf.SymType", imports: ["debug/elf"] })
extern typedef SymType = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>