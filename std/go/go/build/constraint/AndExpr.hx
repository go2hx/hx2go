package go.go.build.constraint;

/**
    An AndExpr represents the expression X && Y.
**/
@:structInit
@:go.Type({ name: "AndExpr", instanceName: "constraint.AndExpr", imports: ["go/build/constraint"] })
extern class AndExpr {

    @:native("X") var X: go.go.build.constraint.Expr;
    @:native("Y") var Y: go.go.build.constraint.Expr;

    function new(X: go.go.build.constraint.Expr=null, Y: go.go.build.constraint.Expr=null);

    @:native("Eval") function eval(ok: (tag: String) -> (Bool)): (Bool);
    @:native("String") function string(): (String);

}