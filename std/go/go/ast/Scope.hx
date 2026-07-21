package go.go.ast;

@:structInit
@:go.Type({ name: "Scope", instanceName: "ast.Scope", imports: ["go/ast"] })
extern class Scope {

    @:native("Outer") var outer: go.Pointer<go.go.ast.Scope>;
    @:native("Objects") var objects: go.Map<String, go.Pointer<go.go.ast.Object>>;

    function new(outer: go.Pointer<go.go.ast.Scope>, objects: go.Map<String, go.Pointer<go.go.ast.Object>>);

    @:native("Insert") function insert(obj: go.Pointer<go.go.ast.Object>): (go.Pointer<go.go.ast.Object>);
    @:native("Lookup") function lookup(name: String): (go.Pointer<go.go.ast.Object>);
    @:native("String") function string(): (String);

}