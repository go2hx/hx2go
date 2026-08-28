package go.debug.gosym;

/**
    An Obj represents a collection of functions in a symbol table.
    
    The exact method of division of a binary into separate Objs is an internal detail
    of the symbol table format.
    
    In early versions of Go each source file became a different Obj.
    
    In Go 1 and Go 1.1, each package produced one Obj for all Go sources
    and one Obj per C source file.
    
    In Go 1.2, there is a single Obj for the entire program.
**/
@:structInit
@:go.Type({ name: "Obj", instanceName: "gosym.Obj", imports: ["debug/gosym"] })
extern class Obj {

    @:native("Funcs") var funcs: go.Slice<go.debug.gosym.Func>;
    @:native("Paths") var paths: go.Slice<go.debug.gosym.Sym>;

    function new(funcs: go.Slice<go.debug.gosym.Func>=null, paths: go.Slice<go.debug.gosym.Sym>=null);

}