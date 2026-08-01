package go.debug.elf;

@:go.Type({ name: "Class", instanceName: "elf.Class", imports: ["debug/elf"] })
extern typedef Class = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>