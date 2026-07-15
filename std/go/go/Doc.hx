package go.go;

@:go.Type({ name: "doc", instanceName: "doc.doc", imports: ["go/doc"] })
extern class Doc {

    @:native("AllDecls") static var AllDecls: go.go.doc.Mode;
    @:native("AllMethods") static var AllMethods: go.go.doc.Mode;
    @:native("PreserveAST") static var PreserveAST: go.go.doc.Mode;

    @:native("IllegalPrefixes") static var IllegalPrefixes: go.Slice<String>;

    @:native("Examples") static function examples(testFiles: haxe.Rest<go.Pointer<go.go.ast.File>>): go.Slice<go.Pointer<go.go.doc.Example>>;
    @:native("IsPredeclared") static function isPredeclared(s: String): Bool;
    @:native("New") static function _new(pkg: go.Pointer<go.go.ast.Package>, importPath: String, mode: go.go.doc.Mode): go.Pointer<go.go.doc.Package>;
    @:native("NewFromFiles") static function newFromFiles(fset: go.Pointer<go.go.token.FileSet>, files: go.Slice<go.Pointer<go.go.ast.File>>, importPath: String, opts: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.go.doc.Package>>;
    @:native("Synopsis") static function synopsis(text: String): String;
    @:native("ToHTML") static function toHTML(w: go.io.Writer, text: String, words: go.Map<String, String>): Void;
    @:native("ToText") static function toText(w: go.io.Writer, text: String, prefix: String, codePrefix: String, width: go.GoInt): Void;

}