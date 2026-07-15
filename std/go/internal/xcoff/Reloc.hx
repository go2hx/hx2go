package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Reloc", instanceName: "xcoff.Reloc", imports: ["internal/xcoff"] })
extern class Reloc {

    @:native("VirtualAddress") var virtualAddress: go.UInt64;
    @:native("Symbol") var symbol: go.Pointer<go.internal.xcoff.Symbol>;
    @:native("Signed") var signed: Bool;
    @:native("InstructionFixed") var instructionFixed: Bool;
    @:native("Length") var length: go.UInt8;
    @:native("Type") var type: go.UInt8;

function new(virtualAddress: go.UInt64, symbol: go.Pointer<go.internal.xcoff.Symbol>, signed: Bool, instructionFixed: Bool, length: go.UInt8, type: go.UInt8);

}