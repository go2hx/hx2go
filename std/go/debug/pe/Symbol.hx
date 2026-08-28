package go.debug.pe;

/**
    Symbol is similar to [COFFSymbol] with Name field replaced
    by Go string. Symbol also does not have NumberOfAuxSymbols.
**/
@:structInit
@:go.Type({ name: "Symbol", instanceName: "pe.Symbol", imports: ["debug/pe"] })
extern class Symbol {

    @:native("Name") var name: String;
    @:native("Value") var value: go.UInt32;
    @:native("SectionNumber") var sectionNumber: go.Int16;
    @:native("Type") var type: go.UInt16;
    @:native("StorageClass") var storageClass: go.UInt8;

    function new(name: String="", value: go.UInt32=0, sectionNumber: go.Int16=0, type: go.UInt16=0, storageClass: go.UInt8=0);

}