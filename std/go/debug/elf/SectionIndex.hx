package go.debug.elf;

/**
    Special section indices.
**/
@:go.Type({ name: "SectionIndex", instanceName: "elf.SectionIndex", imports: ["debug/elf"] })
extern typedef SectionIndex = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>