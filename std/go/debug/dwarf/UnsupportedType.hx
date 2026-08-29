package go.debug.dwarf;

/**
    An UnsupportedType is a placeholder returned in situations where we
    encounter a type that isn't supported.
**/
@:structInit
@:go.Type({ name: "UnsupportedType", instanceName: "dwarf.UnsupportedType", imports: ["debug/dwarf"] })
extern class UnsupportedType {

    @:native("CommonType") var commonType: go.debug.dwarf.CommonType;
    @:native("Tag") var tag: go.debug.dwarf.Tag;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

    function new(commonType: go.debug.dwarf.CommonType, tag: go.debug.dwarf.Tag=cast 0);

    @:native("Common") function common(): (go.Pointer<go.debug.dwarf.CommonType>);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);

}