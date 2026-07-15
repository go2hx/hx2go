package go.debug.dwarf;

@:structInit
@:go.Type({ name: "VoidType", instanceName: "dwarf.VoidType", imports: ["debug/dwarf"] })
extern class VoidType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;

function new(commonType: go.debug.dwarf.CommonType);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}