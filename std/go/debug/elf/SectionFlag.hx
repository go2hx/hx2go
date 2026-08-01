package go.debug.elf;

@:go.Type({ name: "SectionFlag", instanceName: "elf.SectionFlag", imports: ["debug/elf"] })
extern typedef SectionFlag = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>