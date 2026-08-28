package go.debug.elf;

/**
    Data is found in Header.Ident[EI_DATA] and Header.Data.
**/
@:go.Type({ name: "Data", instanceName: "elf.Data", imports: ["debug/elf"] })
extern typedef Data = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>