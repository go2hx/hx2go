package go.debug.gosym;

@:structInit
@:go.Type({ name: "funcTab", instanceName: "gosym.funcTab", imports: ["debug/gosym"] })
extern class FuncTab {

    @:native("LineTable") var lineTable: go.Pointer<go.debug.gosym.LineTable>;
    @:native("Data") var data: go.Slice<go.Byte>;
    @:native("PC") var PC: go.UInt64;
    @:native("Line") var line: go.GoInt;

    function new(lineTable: go.Pointer<go.debug.gosym.LineTable>);

    @:native("Count") function count(): (go.GoInt);
    @:native("LineToPC") function lineToPC(line: go.GoInt, maxpc: go.UInt64): (go.UInt64);
    @:native("PCToLine") function pCToLine(pc: go.UInt64): (go.GoInt);

}