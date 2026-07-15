package go.debug.pe;

@:structInit
@:go.Type({ name: "Reloc", instanceName: "pe.Reloc", imports: ["debug/pe"] })
extern class Reloc {

    @:native("VirtualAddress") var virtualAddress: go.UInt32;
    @:native("SymbolTableIndex") var symbolTableIndex: go.UInt32;
    @:native("Type") var type: go.UInt16;

function new(virtualAddress: go.UInt32, symbolTableIndex: go.UInt32, type: go.UInt16);

}