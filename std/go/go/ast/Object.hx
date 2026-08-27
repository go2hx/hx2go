package go.go.ast;

@:structInit
@:go.Type({ name: "Object", instanceName: "ast.Object", imports: ["go/ast"] })
extern class Object {

    @:native("Kind") var kind: go.go.ast.ObjKind;
    @:native("Name") var name: String;
    @:native("Decl") var decl: Dynamic;
    @:native("Data") var data: Dynamic;
    @:native("Type") var type: Dynamic;

    function new(kind: go.go.ast.ObjKind=cast 0, name: String="", decl: Dynamic=null, data: Dynamic=null, type: Dynamic=null);

    @:native("Pos") function pos(): (go.go.token.Pos);

}