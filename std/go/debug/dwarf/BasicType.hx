package go.debug.dwarf;

@:structInit
@:go.Type({ name: "BasicType", instanceName: "dwarf.BasicType", imports: ["debug/dwarf"] })
extern class BasicType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("BitSize") var bitSize: go.Int64;
    @:native("BitOffset") var bitOffset: go.Int64;
    @:native("DataBitOffset") var dataBitOffset: go.Int64;

function new(commonType: go.debug.dwarf.CommonType, bitSize: go.Int64, bitOffset: go.Int64, dataBitOffset: go.Int64);

    @:native("Basic") function basic(): go.Pointer<go.debug.dwarf.BasicType>;
    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;
    @:native("String") function string(): String;

}