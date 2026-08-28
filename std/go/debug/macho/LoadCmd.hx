package go.debug.macho;

/**
    A LoadCmd is a Mach-O load command.
**/
@:go.Type({ name: "LoadCmd", instanceName: "macho.LoadCmd", imports: ["debug/macho"] })
extern typedef LoadCmd = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>