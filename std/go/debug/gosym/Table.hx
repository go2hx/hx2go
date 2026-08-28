package go.debug.gosym;

/**
    Table represents a Go symbol table. It stores all of the
    symbols decoded from the program and provides methods to translate
    between symbols, names, and addresses.
**/
@:structInit
@:go.Type({ name: "Table", instanceName: "gosym.Table", imports: ["debug/gosym"] })
extern class Table {

    @:native("Syms") var syms: go.Slice<go.debug.gosym.Sym>;
    @:native("Funcs") var funcs: go.Slice<go.debug.gosym.Func>;
    @:native("Files") var files: go.Map<String, go.Pointer<go.debug.gosym.Obj>>;
    @:native("Objs") var objs: go.Slice<go.debug.gosym.Obj>;

    function new(syms: go.Slice<go.debug.gosym.Sym>=null, funcs: go.Slice<go.debug.gosym.Func>=null, files: go.Map<String, go.Pointer<go.debug.gosym.Obj>>=null, objs: go.Slice<go.debug.gosym.Obj>=null);

    /**
        LineToPC looks up the first program counter on the given line in
        the named file. It returns [UnknownFileError] or [UnknownLineError] if
        there is an error looking up this line.
    **/
    @:go.Tuple("pc", "fn", "err") @:native("LineToPC") function lineToPC(file: String, line: go.GoInt): (go.Tuple<{ pc: go.UInt64, fn: go.Pointer<go.debug.gosym.Func>, err: go.Error }>);
    /**
        LookupFunc returns the text, data, or bss symbol with the given name,
        or nil if no such symbol is found.
    **/
    @:native("LookupFunc") function lookupFunc(name: String): (go.Pointer<go.debug.gosym.Func>);
    /**
        LookupSym returns the text, data, or bss symbol with the given name,
        or nil if no such symbol is found.
    **/
    @:native("LookupSym") function lookupSym(name: String): (go.Pointer<go.debug.gosym.Sym>);
    /**
        PCToFunc returns the function containing the program counter pc,
        or nil if there is no such function.
    **/
    @:native("PCToFunc") function pCToFunc(pc: go.UInt64): (go.Pointer<go.debug.gosym.Func>);
    /**
        PCToLine looks up line number information for a program counter.
        If there is no information, it returns fn == nil.
    **/
    @:go.Tuple("file", "line", "fn") @:native("PCToLine") function pCToLine(pc: go.UInt64): (go.Tuple<{ file: String, line: go.GoInt, fn: go.Pointer<go.debug.gosym.Func> }>);
    /**
        SymByAddr returns the text, data, or bss symbol starting at the given address.
    **/
    @:native("SymByAddr") function symByAddr(addr: go.UInt64): (go.Pointer<go.debug.gosym.Sym>);

}