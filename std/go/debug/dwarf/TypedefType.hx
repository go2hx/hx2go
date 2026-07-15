package go.debug.dwarf;

@:structInit
@:go.Type({ name: "TypedefType", instanceName: "dwarf.TypedefType", imports: ["debug/dwarf"] })
extern class TypedefType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Type") var type: go.debug.dwarf.Type;

function new(commonType: go.debug.dwarf.CommonType, type: go.debug.dwarf.Type);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}