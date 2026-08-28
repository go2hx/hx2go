package go.debug.dwarf;

/**
    A DotDotDotType represents the variadic ... function parameter.
**/
@:structInit
@:go.Type({ name: "DotDotDotType", instanceName: "dwarf.DotDotDotType", imports: ["debug/dwarf"] })
extern class DotDotDotType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}