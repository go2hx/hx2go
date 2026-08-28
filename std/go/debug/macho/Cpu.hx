package go.debug.macho;

/**
    A Cpu is a Mach-O cpu type.
**/
@:go.Type({ name: "Cpu", instanceName: "macho.Cpu", imports: ["debug/macho"] })
extern typedef Cpu = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>