package go.debug.dwarf;

/**
    An IntType represents a signed integer type.
**/
@:structInit
@:go.Type({ name: "IntType", instanceName: "dwarf.IntType", imports: ["debug/dwarf"] })
extern class IntType {

    @:native("BasicType") var basicType: go.debug.dwarf.BasicType;
    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("BitSize") var bitSize: go.Int64;
    @:native("BitOffset") var bitOffset: go.Int64;
    @:native("DataBitOffset") var dataBitOffset: go.Int64;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(basicType: go.debug.dwarf.BasicType);

    @:native("Basic") function basic(): (go.Pointer<go.debug.dwarf.BasicType>);
    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}