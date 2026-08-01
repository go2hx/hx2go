package go.debug.elf;

@:go.Type({ name: "ProgType", instanceName: "elf.ProgType", imports: ["debug/elf"] })
extern typedef ProgType = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>