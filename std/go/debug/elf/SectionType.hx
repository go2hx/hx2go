package go.debug.elf;

@:go.Type({ name: "SectionType", instanceName: "elf.SectionType", imports: ["debug/elf"] })
extern typedef SectionType = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>