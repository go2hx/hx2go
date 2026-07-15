package go.debug.pe;

@:structInit
@:go.Type({ name: "SectionHeader32", instanceName: "pe.SectionHeader32", imports: ["debug/pe"] })
extern class SectionHeader32 {

    @:native("Name") var name: go.GoArray<go.UInt8, 8>;
    @:native("VirtualSize") var virtualSize: go.UInt32;
    @:native("VirtualAddress") var virtualAddress: go.UInt32;
    @:native("SizeOfRawData") var sizeOfRawData: go.UInt32;
    @:native("PointerToRawData") var pointerToRawData: go.UInt32;
    @:native("PointerToRelocations") var pointerToRelocations: go.UInt32;
    @:native("PointerToLineNumbers") var pointerToLineNumbers: go.UInt32;
    @:native("NumberOfRelocations") var numberOfRelocations: go.UInt16;
    @:native("NumberOfLineNumbers") var numberOfLineNumbers: go.UInt16;
    @:native("Characteristics") var characteristics: go.UInt32;

function new(name: go.GoArray<go.UInt8, 8>, virtualSize: go.UInt32, virtualAddress: go.UInt32, sizeOfRawData: go.UInt32, pointerToRawData: go.UInt32, pointerToRelocations: go.UInt32, pointerToLineNumbers: go.UInt32, numberOfRelocations: go.UInt16, numberOfLineNumbers: go.UInt16, characteristics: go.UInt32);

}