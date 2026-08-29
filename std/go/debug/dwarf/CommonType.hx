package go.debug.dwarf;

/**
    A CommonType holds fields common to multiple types.
    If a field is not known or not applicable for a given type,
    the zero value is used.
**/
@:structInit
@:go.Type({ name: "CommonType", instanceName: "dwarf.CommonType", imports: ["debug/dwarf"] })
extern class CommonType {

    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(byteSize: go.Int64=0, name: String="");

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);

}