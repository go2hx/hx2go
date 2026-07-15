package go.go.doc;

@:structInit
@:go.Type({ name: "Func", instanceName: "doc.Func", imports: ["go/doc"] })
extern class Func {

    @:native("Doc") var doc: String;
    @:native("Name") var name: String;
    @:native("Decl") var decl: go.Pointer<go.go.ast.FuncDecl>;
    @:native("Recv") var recv: String;
    @:native("Orig") var orig: String;
    @:native("Level") var level: go.GoInt;
    @:native("Examples") var examples: go.Slice<go.Pointer<go.go.doc.Example>>;

function new(doc: String, name: String, decl: go.Pointer<go.go.ast.FuncDecl>, recv: String, orig: String, level: go.GoInt, examples: go.Slice<go.Pointer<go.go.doc.Example>>);

}