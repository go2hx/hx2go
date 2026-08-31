package go.go.ast;

/**
    A Package node represents a set of source files
    collectively building a Go package.
    
    Deprecated: use the type checker [go/types] instead; see [Object].
**/
@:structInit
@:go.Type({ name: "Package", instanceName: "ast.Package", imports: ["go/ast"] })
extern class Package {

    @:native("Name") var name: String;
    @:native("Scope") var scope: go.Pointer<go.go.ast.Scope>;
    @:native("Imports") var imports: go.Map<String, go.Pointer<go.go.ast.Object>>;
    @:native("Files") var files: go.Map<String, go.Pointer<go.go.ast.File>>;

    function new(name: String="", scope: go.Pointer<go.go.ast.Scope>=null, imports: go.Map<String, go.Pointer<go.go.ast.Object>>=null, files: go.Map<String, go.Pointer<go.go.ast.File>>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}