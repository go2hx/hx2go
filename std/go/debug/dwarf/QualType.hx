package go.debug.dwarf;

/**
    A QualType represents a type that has the C/C++ "const", "restrict", or "volatile" qualifier.
**/
@:structInit
@:go.Type({ name: "QualType", instanceName: "dwarf.QualType", imports: ["debug/dwarf"] })
extern class QualType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Qual") var qual: String;
    @:native("Type") var type: go.debug.dwarf.Type;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, qual: String="", type: go.debug.dwarf.Type=null);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}