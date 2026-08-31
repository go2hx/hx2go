package go.debug.dwarf;

/**
    An EnumValue represents a single enumeration value.
**/
@:structInit
@:go.Type({ name: "EnumValue", instanceName: "dwarf.EnumValue", imports: ["debug/dwarf"] })
extern class EnumValue {

    @:native("Name") var name: String;
    @:native("Val") var val: go.Int64;

    function new(name: String="", val: go.Int64=0);

}