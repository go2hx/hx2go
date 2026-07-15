package go.debug.dwarf;

@:structInit
@:go.Type({ name: "FuncType", instanceName: "dwarf.FuncType", imports: ["debug/dwarf"] })
extern class FuncType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("ReturnType") var returnType: go.debug.dwarf.Type;
    @:native("ParamType") var paramType: go.Slice<go.debug.dwarf.Type>;

function new(commonType: go.debug.dwarf.CommonType, returnType: go.debug.dwarf.Type, paramType: go.Slice<go.debug.dwarf.Type>);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}