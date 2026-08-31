package go.debug.elf;

/**
    Class is found in Header.Ident[EI_CLASS] and Header.Class.
**/
@:go.Type({ name: "Class", instanceName: "elf.Class", imports: ["debug/elf"] })
extern typedef Class = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>