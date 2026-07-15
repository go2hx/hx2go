package go.debug.pe;

@:structInit
@:go.Type({ name: "COFFSymbol", instanceName: "pe.COFFSymbol", imports: ["debug/pe"] })
extern class COFFSymbol {

    @:native("Name") var name: go.GoArray<go.UInt8, 8>;
    @:native("Value") var value: go.UInt32;
    @:native("SectionNumber") var sectionNumber: go.Int16;
    @:native("Type") var type: go.UInt16;
    @:native("StorageClass") var storageClass: go.UInt8;
    @:native("NumberOfAuxSymbols") var numberOfAuxSymbols: go.UInt8;

function new(name: go.GoArray<go.UInt8, 8>, value: go.UInt32, sectionNumber: go.Int16, type: go.UInt16, storageClass: go.UInt8, numberOfAuxSymbols: go.UInt8);

    @:native("FullName") function fullName(st: go.debug.pe.StringTable): go.Result<String>;

}