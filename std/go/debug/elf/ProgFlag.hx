package go.debug.elf;

/**
    Prog.Flag
**/
@:go.Type({ name: "ProgFlag", instanceName: "elf.ProgFlag", imports: ["debug/elf"] })
extern typedef ProgFlag = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>