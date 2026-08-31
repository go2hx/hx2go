package go.debug.elf;

/**
    Symbol type - ELFNN_ST_TYPE - st_info
**/
@:go.Type({ name: "SymType", instanceName: "elf.SymType", imports: ["debug/elf"] })
extern typedef SymType = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>