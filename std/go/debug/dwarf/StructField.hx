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

    function new(name: String="", type: go.debug.dwarf.Type=null, byteOffset: go.Int64=0, byteSize: go.Int64=0, bitOffset: go.Int64=0, dataBitOffset: go.Int64=0, bitSize: go.Int64=0);

}