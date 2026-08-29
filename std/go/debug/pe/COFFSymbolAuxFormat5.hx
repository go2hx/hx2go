package go.debug.pe;

/**
    COFFSymbolAuxFormat5 describes the expected form of an aux symbol
    attached to a section definition symbol. The PE format defines a
    number of different aux symbol formats: format 1 for function
    definitions, format 2 for .be and .ef symbols, and so on. Format 5
    holds extra info associated with a section definition, including
    number of relocations + line numbers, as well as COMDAT info. See
    https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#auxiliary-format-5-section-definitions
    for more on what's going on here.
**/
@:structInit
@:go.Type({ name: "COFFSymbolAuxFormat5", instanceName: "pe.COFFSymbolAuxFormat5", imports: ["debug/pe"] })
extern class COFFSymbolAuxFormat5 {

    @:native("Size") var size: go.UInt32;
    @:native("NumRelocs") var numRelocs: go.UInt16;
    @:native("NumLineNumbers") var numLineNumbers: go.UInt16;
    @:native("Checksum") var checksum: go.UInt32;
    @:native("SecNum") var secNum: go.UInt16;
    @:native("Selection") var selection: go.UInt8;

    function new(size: go.UInt32=0, numRelocs: go.UInt16=0, numLineNumbers: go.UInt16=0, checksum: go.UInt32=0, secNum: go.UInt16=0, selection: go.UInt8=0);

}