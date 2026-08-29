package go.debug.elf;

/**
    Type is found in Header.Type.
**/
@:go.Type({ name: "Type", instanceName: "elf.Type", imports: ["debug/elf"] })
extern typedef Type = haxe.extern.EitherType<go.UInt16, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>