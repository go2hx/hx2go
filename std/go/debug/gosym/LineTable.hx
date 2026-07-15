package go.debug.gosym;

@:structInit
@:go.Type({ name: "LineTable", instanceName: "gosym.LineTable", imports: ["debug/gosym"] })
extern class LineTable {

    @:native("Data") var data: go.Slice<go.Byte>;
    @:native("PC") var PC: go.UInt64;
    @:native("Line") var line: go.GoInt;

function new(data: go.Slice<go.Byte>, PC: go.UInt64, line: go.GoInt);

    @:native("LineToPC") function lineToPC(line: go.GoInt, maxpc: go.UInt64): go.UInt64;
    @:native("PCToLine") function pCToLine(pc: go.UInt64): go.GoInt;

}