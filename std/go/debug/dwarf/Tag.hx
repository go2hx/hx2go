package go.debug.dwarf;

/**
    A Tag is the classification (the type) of an [Entry].
**/
@:go.Type({ name: "Tag", instanceName: "dwarf.Tag", imports: ["debug/dwarf"] })
extern typedef Tag = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>