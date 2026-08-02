package go.debug.elf;

@:go.Type({ name: "ProgFlag", instanceName: "elf.ProgFlag", imports: ["debug/elf"] })
extern typedef ProgFlag = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>