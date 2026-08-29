package go.go.build.constraint;

/**
    An Expr is a build tag constraint expression.
    The underlying concrete type is *[AndExpr], *[OrExpr], *[NotExpr], or *[TagExpr].
**/
@:go.Type({ name: "Expr", instanceName: "constraint.Expr", imports: ["go/build/constraint"] })
extern typedef Expr = {

    @:native("Eval") function eval(ok: (tag: String) -> (Bool)): (Bool);
    @:native("String") function string(): (String);

}