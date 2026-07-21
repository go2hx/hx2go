package go.go.types;

@:structInit
@:go.Type({ name: "Initializer", instanceName: "types.Initializer", imports: ["go/types"] })
extern class Initializer {

    @:native("Lhs") var lhs: go.Slice<go.Pointer<go.go.types.Var>>;
    @:native("Rhs") var rhs: go.go.ast.Expr;

    function new(lhs: go.Slice<go.Pointer<go.go.types.Var>>, rhs: go.go.ast.Expr);

    @:native("String") function string(): (String);

}