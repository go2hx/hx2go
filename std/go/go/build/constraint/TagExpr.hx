package go.go.build.constraint;

@:structInit
@:go.Type({ name: "TagExpr", instanceName: "constraint.TagExpr", imports: ["go/build/constraint"] })
extern class TagExpr {

    @:native("Tag") var tag: String;

    function new(tag: String);

    @:native("Eval") function eval(ok: (tag: String) -> (Bool)): (Bool);
    @:native("String") function string(): (String);

}