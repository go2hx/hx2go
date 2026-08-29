package go.debug.dwarf;

/**
    An EnumType represents an enumerated type.
    The only indication of its native integer type is its ByteSize
    (inside [CommonType]).
**/
@:structInit
@:go.Type({ name: "EnumType", instanceName: "dwarf.EnumType", imports: ["debug/dwarf"] })
extern class EnumType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("EnumName") var enumName: String;
    @:native("Val") var val: go.Slice<go.Pointer<go.debug.dwarf.EnumValue>>;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, enumName: String="", val: go.Slice<go.Pointer<go.debug.dwarf.EnumValue>>=null);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}