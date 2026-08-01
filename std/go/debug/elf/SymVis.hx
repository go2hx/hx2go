package go.debug.elf;

@:go.Type({ name: "SymVis", instanceName: "elf.SymVis", imports: ["debug/elf"] })
extern typedef SymVis = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>