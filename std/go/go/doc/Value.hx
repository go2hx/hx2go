package go.go.doc;

@:structInit
@:go.Type({ name: "Value", instanceName: "doc.Value", imports: ["go/doc"] })
extern class Value {

    @:native("Doc") var doc: String;
    @:native("Names") var names: go.Slice<String>;
    @:native("Decl") var decl: go.Pointer<go.go.ast.GenDecl>;

function new(doc: String, names: go.Slice<String>, decl: go.Pointer<go.go.ast.GenDecl>);

}