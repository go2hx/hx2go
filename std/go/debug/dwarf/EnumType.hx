package go.debug.dwarf;

@:structInit
@:go.Type({ name: "EnumType", instanceName: "dwarf.EnumType", imports: ["debug/dwarf"] })
extern class EnumType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("EnumName") var enumName: String;
    @:native("Val") var val: go.Slice<go.Pointer<go.debug.dwarf.EnumValue>>;

function new(commonType: go.debug.dwarf.CommonType, enumName: String, val: go.Slice<go.Pointer<go.debug.dwarf.EnumValue>>);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}