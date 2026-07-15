package go.debug.dwarf;

@:structInit
@:go.Type({ name: "StructField", instanceName: "dwarf.StructField", imports: ["debug/dwarf"] })
extern class StructField {

    @:native("Name") var name: String;
    @:native("Type") var type: go.debug.dwarf.Type;
    @:native("ByteOffset") var byteOffset: go.Int64;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("BitOffset") var bitOffset: go.Int64;
    @:native("DataBitOffset") var dataBitOffset: go.Int64;
    @:native("BitSize") var bitSize: go.Int64;

function new(name: String, type: go.debug.dwarf.Type, byteOffset: go.Int64, byteSize: go.Int64, bitOffset: go.Int64, dataBitOffset: go.Int64, bitSize: go.Int64);

}