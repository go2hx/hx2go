package go.debug.dwarf;

@:structInit
@:go.Type({ name: "FuncType", instanceName: "dwarf.FuncType", imports: ["debug/dwarf"] })
extern class FuncType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("ReturnType") var returnType: go.debug.dwarf.Type;
    @:native("ParamType") var paramType: go.Slice<go.debug.dwarf.Type>;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, returnType: go.debug.dwarf.Type=null, paramType: go.Slice<go.debug.dwarf.Type>=null);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}