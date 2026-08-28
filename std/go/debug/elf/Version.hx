package go.debug.elf;

/**
    Version is found in Header.Ident[EI_VERSION] and Header.Version.
**/
@:go.Type({ name: "Version", instanceName: "elf.Version", imports: ["debug/elf"] })
extern typedef Version = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>