package go.go.ast;

/**
    A Scope maintains the set of named language entities declared
    in the scope and a link to the immediately surrounding (outer)
    scope.
    
    Deprecated: use the type checker [go/types] instead; see [Object].
**/
@:structInit
@:go.Type({ name: "Scope", instanceName: "ast.Scope", imports: ["go/ast"] })
extern class Scope {

    @:native("Outer") var outer: go.Pointer<go.go.ast.Scope>;
    @:native("Objects") var objects: go.Map<String, go.Pointer<go.go.ast.Object>>;

    function new(outer: go.Pointer<go.go.ast.Scope>=null, objects: go.Map<String, go.Pointer<go.go.ast.Object>>=null);

    /**
        Insert attempts to insert a named object obj into the scope s.
        If the scope already contains an object alt with the same name,
        Insert leaves the scope unchanged and returns alt. Otherwise
        it inserts obj and returns nil.
    **/
    @:native("Insert") function insert(obj: go.Pointer<go.go.ast.Object>): (go.Pointer<go.go.ast.Object>);
    /**
        Lookup returns the object with the given name if it is
        found in scope s, otherwise it returns nil. Outer scopes
        are ignored.
    **/
    @:native("Lookup") function lookup(name: String): (go.Pointer<go.go.ast.Object>);
    /**
        Debugging support
    **/
    @:native("String") function string(): (String);

}