package go.go.build.constraint;

@:go.Type({ name: "Expr", instanceName: "constraint.Expr", imports: ["go/build/constraint"] })
extern typedef Expr = {

    @:native("Eval") function eval(ok: (tag: String) -> (Bool)): (Bool);
    @:native("String") function string(): (String);

}