package go.debug.elf;

/**
    NType values; used in core files.
**/
@:go.Type({ name: "NType", instanceName: "elf.NType", imports: ["debug/elf"] })
extern typedef NType = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>