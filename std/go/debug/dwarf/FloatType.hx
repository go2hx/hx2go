package go.debug.dwarf;

@:structInit
@:go.Type({ name: "FloatType", instanceName: "dwarf.FloatType", imports: ["debug/dwarf"] })
extern class FloatType {

    @:native("BasicType") var basicType: go.debug.dwarf.BasicType;

function new(basicType: go.debug.dwarf.BasicType);

    @:native("Basic") function basic(): go.Pointer<go.debug.dwarf.BasicType>;
    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}