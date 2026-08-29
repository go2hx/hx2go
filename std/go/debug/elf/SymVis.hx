package go.debug.elf;

/**
    Symbol visibility - ELFNN_ST_VISIBILITY - st_other
**/
@:go.Type({ name: "SymVis", instanceName: "elf.SymVis", imports: ["debug/elf"] })
extern typedef SymVis = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>