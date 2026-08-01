package go.debug.dwarf;

@:go.Type({ name: "Tag", instanceName: "dwarf.Tag", imports: ["debug/dwarf"] })
extern typedef Tag = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>