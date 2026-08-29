package go.debug.elf;

/**
    Machine is found in Header.Machine.
**/
@:go.Type({ name: "Machine", instanceName: "elf.Machine", imports: ["debug/elf"] })
extern typedef Machine = haxe.extern.EitherType<go.UInt16, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>