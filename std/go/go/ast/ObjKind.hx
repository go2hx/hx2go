package go.go.ast;

@:go.Type({ name: "ObjKind", instanceName: "ast.ObjKind", imports: ["go/ast"] })
extern typedef ObjKind = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>