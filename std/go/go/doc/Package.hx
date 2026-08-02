package go.go.doc;

@:structInit
@:go.Type({ name: "Package", instanceName: "doc.Package", imports: ["go/doc"] })
extern class Package {

    @:native("Doc") var doc: String;
    @:native("Name") var name: String;
    @:native("ImportPath") var importPath: String;
    @:native("Imports") var imports: go.Slice<String>;
    @:native("Filenames") var filenames: go.Slice<String>;
    @:native("Notes") var notes: go.Map<String, go.Slice<go.Pointer<go.go.doc.Note>>>;
    @:native("Bugs") var bugs: go.Slice<String>;
    @:native("Consts") var consts: go.Slice<go.Pointer<go.go.doc.Value>>;
    @:native("Types") var types: go.Slice<go.Pointer<go.go.doc.Type>>;
    @:native("Vars") var vars: go.Slice<go.Pointer<go.go.doc.Value>>;
    @:native("Funcs") var funcs: go.Slice<go.Pointer<go.go.doc.Func>>;
    @:native("Examples") var examples: go.Slice<go.Pointer<go.go.doc.Example>>;

    function new(doc: String, name: String, importPath: String, imports: go.Slice<String>, filenames: go.Slice<String>, notes: go.Map<String, go.Slice<go.Pointer<go.go.doc.Note>>>, bugs: go.Slice<String>, consts: go.Slice<go.Pointer<go.go.doc.Value>>, types: go.Slice<go.Pointer<go.go.doc.Type>>, vars: go.Slice<go.Pointer<go.go.doc.Value>>, funcs: go.Slice<go.Pointer<go.go.doc.Func>>, examples: go.Slice<go.Pointer<go.go.doc.Example>>);

    @:native("Filter") function filter(f: go.go.doc.Filter): Void;
    @:native("HTML") function HTML(text: String): (go.Slice<go.Byte>);
    @:native("Markdown") function markdown(text: String): (go.Slice<go.Byte>);
    @:native("Parser") function parser(): (go.Pointer<go.go.doc.comment.Parser>);
    @:native("Printer") function printer(): (go.Pointer<go.go.doc.comment.Printer>);
    @:native("Synopsis") function synopsis(text: String): (String);
    @:native("Text") function text(text: String): (go.Slice<go.Byte>);

}