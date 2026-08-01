package go.debug.dwarf;

@:go.Type({ name: "Attr", instanceName: "dwarf.Attr", imports: ["debug/dwarf"] })
extern typedef Attr = haxe.extern.EitherType<go.UInt32, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>