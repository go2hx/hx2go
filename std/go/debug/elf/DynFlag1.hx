package go.debug.elf;

@:go.Type({ name: "DynFlag1", instanceName: "elf.DynFlag1", imports: ["debug/elf"] })
extern typedef DynFlag1 = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>