package go.debug.dwarf;

@:structInit
@:go.Type({ name: "CommonType", instanceName: "dwarf.CommonType", imports: ["debug/dwarf"] })
extern class CommonType {

    @:native("ByteSize") var byteSize: go.Int64;
    @:native("Name") var name: String;

function new(byteSize: go.Int64, name: String);

    @:native("Common") function common(): go.Pointer<go.debug.dwarf.CommonType>;
    @:native("Size") function size(): go.Int64;

}