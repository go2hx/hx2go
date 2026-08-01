package go.debug.elf;

@:go.Type({ name: "DynFlag", instanceName: "elf.DynFlag", imports: ["debug/elf"] })
extern typedef DynFlag = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>