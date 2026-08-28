package go.debug.pe;

/**
    StringTable is a COFF string table.
**/
@:go.Type({ name: "StringTable", instanceName: "pe.StringTable", imports: ["debug/pe"] })
extern class StringTable {

    /**
        String extracts string from COFF string table st at offset start.
    **/
    @:native("String") function string(start: go.UInt32): (go.Result<String>);

}