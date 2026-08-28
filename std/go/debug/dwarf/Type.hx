package go.debug.dwarf;

/**
    A Type conventionally represents a pointer to any of the
    specific Type structures ([CharType], [StructType], etc.).
**/
@:go.Type({ name: "Type", instanceName: "dwarf.Type", imports: ["debug/dwarf"] })
extern typedef Type = {

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}