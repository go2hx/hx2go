package go.debug.elf;

/**
    Section compression type.
**/
@:go.Type({ name: "CompressionType", instanceName: "elf.CompressionType", imports: ["debug/elf"] })
extern typedef CompressionType = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>