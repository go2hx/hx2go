package go.debug.dwarf;

@:structInit
@:go.Type({ name: "QualType", instanceName: "dwarf.QualType", imports: ["debug/dwarf"] })
extern class QualType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Qual") var qual: String;
    @:native("Type") var type: go.debug.dwarf.Type;

function new(commonType: go.debug.dwarf.CommonType, qual: String, type: go.debug.dwarf.Type);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}