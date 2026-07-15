package go.debug.dwarf;

@:structInit
@:go.Type({ name: "UnsupportedType", instanceName: "dwarf.UnsupportedType", imports: ["debug/dwarf"] })
extern class UnsupportedType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Tag") var tag: go.debug.dwarf.Tag;

function new(commonType: go.debug.dwarf.CommonType, tag: go.debug.dwarf.Tag);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}