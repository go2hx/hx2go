package go.go.build.constraint;

@:structInit
@:go.Type({ name: "NotExpr", instanceName: "constraint.NotExpr", imports: ["go/build/constraint"] })
extern class NotExpr {

    @:native("X") var X: go.go.build.constraint.Expr;

function new(X: go.go.build.constraint.Expr);

    @:native("Eval") function eval(ok: (tag: String) -> Bool): Bool;
    @:native("String") function string(): String;

}