package go.debug.pe;

@:structInit
@:go.Type({ name: "Symbol", instanceName: "pe.Symbol", imports: ["debug/pe"] })
extern class Symbol {

    @:native("Name") var name: String;
    @:native("Value") var value: go.UInt32;
    @:native("SectionNumber") var sectionNumber: go.Int16;
    @:native("Type") var type: go.UInt16;
    @:native("StorageClass") var storageClass: go.UInt8;

function new(name: String, value: go.UInt32, sectionNumber: go.Int16, type: go.UInt16, storageClass: go.UInt8);

}