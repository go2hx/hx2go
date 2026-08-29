package go.go.doc;

/**
    Value is the documentation for a (possibly grouped) var or const declaration.
**/
@:structInit
@:go.Type({ name: "Value", instanceName: "doc.Value", imports: ["go/doc"] })
extern class Value {

    @:native("Doc") var doc: String;
    @:native("Names") var names: go.Slice<String>;
    @:native("Decl") var decl: go.Pointer<go.go.ast.GenDecl>;

    function new(doc: String="", names: go.Slice<String>=null, decl: go.Pointer<go.go.ast.GenDecl>=null);

}