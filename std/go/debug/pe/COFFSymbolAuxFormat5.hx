package go.debug.pe;

@:structInit
@:go.Type({ name: "COFFSymbolAuxFormat5", instanceName: "pe.COFFSymbolAuxFormat5", imports: ["debug/pe"] })
extern class COFFSymbolAuxFormat5 {

    @:native("Size") var size: go.UInt32;
    @:native("NumRelocs") var numRelocs: go.UInt16;
    @:native("NumLineNumbers") var numLineNumbers: go.UInt16;
    @:native("Checksum") var checksum: go.UInt32;
    @:native("SecNum") var secNum: go.UInt16;
    @:native("Selection") var selection: go.UInt8;

function new(size: go.UInt32, numRelocs: go.UInt16, numLineNumbers: go.UInt16, checksum: go.UInt32, secNum: go.UInt16, selection: go.UInt8);

}