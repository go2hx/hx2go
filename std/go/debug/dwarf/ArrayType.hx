package go.debug.dwarf;

/**
    An ArrayType represents a fixed size array type.
**/
@:structInit
@:go.Type({ name: "ArrayType", instanceName: "dwarf.ArrayType", imports: ["debug/dwarf"] })
extern class ArrayType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Type") var type: go.debug.dwarf.Type;
    @:native("StrideBitSize") var strideBitSize: go.Int64;
    @:native("Count") var count: go.Int64;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, type: go.debug.dwarf.Type=null, strideBitSize: go.Int64=0, count: go.Int64=0);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}