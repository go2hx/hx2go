package go.debug.pe;

@:structInit
@:go.Type({ name: "SectionHeader", instanceName: "pe.SectionHeader", imports: ["debug/pe"] })
extern class SectionHeader {

    @:native("Name") var name: String;
    @:native("VirtualSize") var virtualSize: go.UInt32;
    @:native("VirtualAddress") var virtualAddress: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Offset") var offset: go.UInt32;
    @:native("PointerToRelocations") var pointerToRelocations: go.UInt32;
    @:native("PointerToLineNumbers") var pointerToLineNumbers: go.UInt32;
    @:native("NumberOfRelocations") var numberOfRelocations: go.UInt16;
    @:native("NumberOfLineNumbers") var numberOfLineNumbers: go.UInt16;
    @:native("Characteristics") var characteristics: go.UInt32;

    function new(name: String="", virtualSize: go.UInt32=0, virtualAddress: go.UInt32=0, size: go.UInt32=0, offset: go.UInt32=0, pointerToRelocations: go.UInt32=0, pointerToLineNumbers: go.UInt32=0, numberOfRelocations: go.UInt16=0, numberOfLineNumbers: go.UInt16=0, characteristics: go.UInt32=0);

}