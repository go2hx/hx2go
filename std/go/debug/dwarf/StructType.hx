package go.debug.dwarf;

@:structInit
@:go.Type({ name: "StructType", instanceName: "dwarf.StructType", imports: ["debug/dwarf"] })
extern class StructType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("StructName") var structName: String;
    @:native("Kind") var kind: String;
    @:native("Field") var field: go.Slice<go.Pointer<go.debug.dwarf.StructField>>;
    @:native("Incomplete") var incomplete: Bool;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, structName: String="", kind: String="", field: go.Slice<go.Pointer<go.debug.dwarf.StructField>>=null, incomplete: Bool=false);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Defn") function defn(): (String);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}