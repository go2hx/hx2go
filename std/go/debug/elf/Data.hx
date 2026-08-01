package go.debug.elf;

@:go.Type({ name: "Data", instanceName: "elf.Data", imports: ["debug/elf"] })
extern typedef Data = haxe.extern.EitherType<go.Byte, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>