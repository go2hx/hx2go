package go.go;

@:go.Type({ name: "ast", instanceName: "ast.ast", imports: ["go/ast"] })
extern class Ast {

    @:native("Bad") static var Bad: go.go.ast.ObjKind;
    @:native("Con") static var Con: go.go.ast.ObjKind;
    @:native("FilterFuncDuplicates") static var FilterFuncDuplicates: go.go.ast.MergeMode;
    @:native("FilterImportDuplicates") static var FilterImportDuplicates: go.go.ast.MergeMode;
    @:native("FilterUnassociatedComments") static var FilterUnassociatedComments: go.go.ast.MergeMode;
    @:native("Fun") static var Fun: go.go.ast.ObjKind;
    @:native("Lbl") static var Lbl: go.go.ast.ObjKind;
    @:native("Pkg") static var Pkg: go.go.ast.ObjKind;
    @:native("RECV") static var RECV: go.go.ast.ChanDir;
    @:native("SEND") static var SEND: go.go.ast.ChanDir;
    @:native("Typ") static var Typ: go.go.ast.ObjKind;
    @:native("Var") static var Var: go.go.ast.ObjKind;

    @:native("FileExports") static function fileExports(src: go.Pointer<go.go.ast.File>): (Bool);
    @:native("FilterDecl") static function filterDecl(decl: go.go.ast.Decl, f: go.go.ast.Filter): (Bool);
    @:native("FilterFile") static function filterFile(src: go.Pointer<go.go.ast.File>, f: go.go.ast.Filter): (Bool);
    @:native("FilterPackage") static function filterPackage(pkg: go.Pointer<go.go.ast.Package>, f: go.go.ast.Filter): (Bool);
    @:native("Fprint") static function fprint(w: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, x: Dynamic, f: go.go.ast.FieldFilter): (go.Error);
    @:native("Inspect") static function inspect(node: go.go.ast.Node, f: (p0: go.go.ast.Node) -> (Bool)): Void;
    @:native("IsExported") static function isExported(name: String): (Bool);
    @:native("IsGenerated") static function isGenerated(file: go.Pointer<go.go.ast.File>): (Bool);
    @:native("MergePackageFiles") static function mergePackageFiles(pkg: go.Pointer<go.go.ast.Package>, mode: go.go.ast.MergeMode): (go.Pointer<go.go.ast.File>);
    @:native("NewCommentMap") static function newCommentMap(fset: go.Pointer<go.go.token.FileSet>, node: go.go.ast.Node, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>): (go.go.ast.CommentMap);
    @:native("NewIdent") static function newIdent(name: String): (go.Pointer<go.go.ast.Ident>);
    @:native("NewObj") static function newObj(kind: go.go.ast.ObjKind, name: String): (go.Pointer<go.go.ast.Object>);
    @:native("NewPackage") static function newPackage(fset: go.Pointer<go.go.token.FileSet>, files: go.Map<String, go.Pointer<go.go.ast.File>>, importer: go.go.ast.Importer, universe: go.Pointer<go.go.ast.Scope>): (go.Result<go.Pointer<go.go.ast.Package>>);
    @:native("NewScope") static function newScope(outer: go.Pointer<go.go.ast.Scope>): (go.Pointer<go.go.ast.Scope>);
    @:native("NotNilFilter") static function notNilFilter(_: String, v: go.reflect.Value): (Bool);
    @:native("PackageExports") static function packageExports(pkg: go.Pointer<go.go.ast.Package>): (Bool);
    @:go.Tuple("p0", "p1") @:native("ParseDirective") static function parseDirective(pos: go.go.token.Pos, c: String): (go.Tuple<{ p0: go.go.ast.Directive, p1: Bool }>);
    @:native("Preorder") static function preorder(root: go.go.ast.Node): (go.iter.Seq<go.go.ast.Node>);
    @:native("PreorderStack") static function preorderStack(root: go.go.ast.Node, stack: go.Slice<go.go.ast.Node>, f: (n: go.go.ast.Node, stack: go.Slice<go.go.ast.Node>) -> (Bool)): Void;
    @:native("Print") static function print(fset: go.Pointer<go.go.token.FileSet>, x: Dynamic): (go.Error);
    @:native("SortImports") static function sortImports(fset: go.Pointer<go.go.token.FileSet>, f: go.Pointer<go.go.ast.File>): Void;
    @:native("Unparen") static function unparen(e: go.go.ast.Expr): (go.go.ast.Expr);
    @:native("Walk") static function walk(v: go.go.ast.Visitor, node: go.go.ast.Node): Void;

}