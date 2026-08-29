package go.debug.elf;

/**
    OSABI is found in Header.Ident[EI_OSABI] and Header.OSABI.
**/
@:go.Type({ name: "OSABI", instanceName: "elf.OSABI", imports: ["debug/elf"] })
extern typedef OSABI = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>