package go.debug.gosym;

/**
    A LineTable is a data structure mapping program counters to line numbers.
    
    In Go 1.1 and earlier, each function (represented by a [Func]) had its own LineTable,
    and the line number corresponded to a numbering of all source lines in the
    program, across all files. That absolute line number would then have to be
    converted separately to a file name and line number within the file.
    
    In Go 1.2, the format of the data changed so that there is a single LineTable
    for the entire program, shared by all Funcs, and there are no absolute line
    numbers, just line numbers within specific files.
    
    For the most part, LineTable's methods should be treated as an internal
    detail of the package; callers should use the methods on [Table] instead.
**/
@:structInit
@:go.Type({ name: "LineTable", instanceName: "gosym.LineTable", imports: ["debug/gosym"] })
extern class LineTable {

    @:native("Data") var data: go.Slice<go.Byte>;
    @:native("PC") var PC: go.UInt64;
    @:native("Line") var line: go.GoInt;

    function new(data: go.Slice<go.Byte>=null, PC: go.UInt64=0, line: go.GoInt=0);

    /**
        LineToPC returns the program counter for the given line number,
        considering only program counters before maxpc.
        
        Deprecated: Use Table's LineToPC method instead.
    **/
    @:native("LineToPC") function lineToPC(line: go.GoInt, maxpc: go.UInt64): (go.UInt64);
    /**
        PCToLine returns the line number for the given program counter.
        
        Deprecated: Use Table's PCToLine method instead.
    **/
    @:native("PCToLine") function pCToLine(pc: go.UInt64): (go.GoInt);

}