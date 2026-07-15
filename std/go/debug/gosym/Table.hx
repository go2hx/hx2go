package go.debug.gosym;

@:structInit
@:go.Type({ name: "Table", instanceName: "gosym.Table", imports: ["debug/gosym"] })
extern class Table {

    @:native("Syms") var syms: go.Slice<go.debug.gosym.Sym>;
    @:native("Funcs") var funcs: go.Slice<go.debug.gosym.Func>;
    @:native("Files") var files: go.Map<String, go.Pointer<go.debug.gosym.Obj>>;
    @:native("Objs") var objs: go.Slice<go.debug.gosym.Obj>;

function new(syms: go.Slice<go.debug.gosym.Sym>, funcs: go.Slice<go.debug.gosym.Func>, files: go.Map<String, go.Pointer<go.debug.gosym.Obj>>, objs: go.Slice<go.debug.gosym.Obj>);

    @:go.Tuple("pc", "fn", "err") @:native("LineToPC") function lineToPC(file: String, line: go.GoInt): go.Tuple<{ pc: go.UInt64, fn: go.Pointer<go.debug.gosym.Func>, err: go.Error }>;
    @:native("LookupFunc") function lookupFunc(name: String): go.Pointer<go.debug.gosym.Func>;
    @:native("LookupSym") function lookupSym(name: String): go.Pointer<go.debug.gosym.Sym>;
    @:native("PCToFunc") function pCToFunc(pc: go.UInt64): go.Pointer<go.debug.gosym.Func>;
    @:go.Tuple("file", "line", "fn") @:native("PCToLine") function pCToLine(pc: go.UInt64): go.Tuple<{ file: String, line: go.GoInt, fn: go.Pointer<go.debug.gosym.Func> }>;
    @:native("SymByAddr") function symByAddr(addr: go.UInt64): go.Pointer<go.debug.gosym.Sym>;

}