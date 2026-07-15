package go.debug.pe;

@:go.Type({ name: "StringTable", instanceName: "pe.StringTable", imports: ["debug/pe"] })
extern class StringTable {

    @:native("String") function string(start: go.UInt32): go.Result<String>;

}