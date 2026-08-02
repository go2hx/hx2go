package go.debug.elf;

@:go.Type({ name: "OSABI", instanceName: "elf.OSABI", imports: ["debug/elf"] })
extern typedef OSABI = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>