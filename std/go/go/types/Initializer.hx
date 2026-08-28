package go.go.types;

/**
    An Initializer describes a package-level variable, or a list of variables in case
    of a multi-valued initialization expression, and the corresponding initialization
    expression.
**/
@:structInit
@:go.Type({ name: "Initializer", instanceName: "types.Initializer", imports: ["go/types"] })
extern class Initializer {

    @:native("Lhs") var lhs: go.Slice<go.Pointer<go.go.types.Var>>;
    @:native("Rhs") var rhs: go.go.ast.Expr;

    function new(lhs: go.Slice<go.Pointer<go.go.types.Var>>=null, rhs: go.go.ast.Expr=null);

    @:native("String") function string(): (std.String);

}