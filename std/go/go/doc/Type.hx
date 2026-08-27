package go.go.doc;

@:structInit
@:go.Type({ name: "Type", instanceName: "doc.Type", imports: ["go/doc"] })
extern class Type {

    @:native("Doc") var doc: String;
    @:native("Name") var name: String;
    @:native("Decl") var decl: go.Pointer<go.go.ast.GenDecl>;
    @:native("Consts") var consts: go.Slice<go.Pointer<go.go.doc.Value>>;
    @:native("Vars") var vars: go.Slice<go.Pointer<go.go.doc.Value>>;
    @:native("Funcs") var funcs: go.Slice<go.Pointer<go.go.doc.Func>>;
    @:native("Methods") var methods: go.Slice<go.Pointer<go.go.doc.Func>>;
    @:native("Examples") var examples: go.Slice<go.Pointer<go.go.doc.Example>>;

    function new(doc: String="", name: String="", decl: go.Pointer<go.go.ast.GenDecl>=null, consts: go.Slice<go.Pointer<go.go.doc.Value>>=null, vars: go.Slice<go.Pointer<go.go.doc.Value>>=null, funcs: go.Slice<go.Pointer<go.go.doc.Func>>=null, methods: go.Slice<go.Pointer<go.go.doc.Func>>=null, examples: go.Slice<go.Pointer<go.go.doc.Example>>=null);

}