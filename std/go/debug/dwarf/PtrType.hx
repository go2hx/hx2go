package go.debug.dwarf;

@:structInit
@:go.Type({ name: "PtrType", instanceName: "dwarf.PtrType", imports: ["debug/dwarf"] })
extern class PtrType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Type") var type: go.debug.dwarf.Type;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, type: go.debug.dwarf.Type=null);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}