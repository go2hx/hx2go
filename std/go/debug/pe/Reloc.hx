package go.debug.pe;

/**
    Reloc represents a PE COFF relocation.
    Each section contains its own relocation list.
**/
@:structInit
@:go.Type({ name: "Reloc", instanceName: "pe.Reloc", imports: ["debug/pe"] })
extern class Reloc {

    @:native("VirtualAddress") var virtualAddress: go.UInt32;
    @:native("SymbolTableIndex") var symbolTableIndex: go.UInt32;
    @:native("Type") var type: go.UInt16;

    function new(virtualAddress: go.UInt32=0, symbolTableIndex: go.UInt32=0, type: go.UInt16=0);

}