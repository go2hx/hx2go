package go.debug.gosym;

@:structInit
@:go.Type({ name: "Obj", instanceName: "gosym.Obj", imports: ["debug/gosym"] })
extern class Obj {

    @:native("Funcs") var funcs: go.Slice<go.debug.gosym.Func>;
    @:native("Paths") var paths: go.Slice<go.debug.gosym.Sym>;

function new(funcs: go.Slice<go.debug.gosym.Func>, paths: go.Slice<go.debug.gosym.Sym>);

}