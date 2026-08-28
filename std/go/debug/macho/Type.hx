package go.debug.macho;

/**
    A Type is the Mach-O file type, e.g. an object file, executable, or dynamic library.
**/
@:go.Type({ name: "Type", instanceName: "macho.Type", imports: ["debug/macho"] })
extern typedef Type = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>