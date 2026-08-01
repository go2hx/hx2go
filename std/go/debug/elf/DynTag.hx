package go.debug.elf;

@:go.Type({ name: "DynTag", instanceName: "elf.DynTag", imports: ["debug/elf"] })
extern typedef DynTag = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>