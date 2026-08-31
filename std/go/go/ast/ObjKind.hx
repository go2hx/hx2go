package go.go.ast;

/**
    ObjKind describes what an [Object] represents.
**/
@:go.Type({ name: "ObjKind", instanceName: "ast.ObjKind", imports: ["go/ast"] })
extern typedef ObjKind = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>