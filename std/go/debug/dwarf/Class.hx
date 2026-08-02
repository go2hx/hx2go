package go.debug.dwarf;

@:go.Type({ name: "Class", instanceName: "dwarf.Class", imports: ["debug/dwarf"] })
extern typedef Class = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>