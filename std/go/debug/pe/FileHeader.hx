package go.debug.pe;

@:structInit
@:go.Type({ name: "FileHeader", instanceName: "pe.FileHeader", imports: ["debug/pe"] })
extern class FileHeader {

    @:native("Machine") var machine: go.UInt16;
    @:native("NumberOfSections") var numberOfSections: go.UInt16;
    @:native("TimeDateStamp") var timeDateStamp: go.UInt32;
    @:native("PointerToSymbolTable") var pointerToSymbolTable: go.UInt32;
    @:native("NumberOfSymbols") var numberOfSymbols: go.UInt32;
    @:native("SizeOfOptionalHeader") var sizeOfOptionalHeader: go.UInt16;
    @:native("Characteristics") var characteristics: go.UInt16;

function new(machine: go.UInt16, numberOfSections: go.UInt16, timeDateStamp: go.UInt32, pointerToSymbolTable: go.UInt32, numberOfSymbols: go.UInt32, sizeOfOptionalHeader: go.UInt16, characteristics: go.UInt16);

}