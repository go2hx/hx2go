package go.golang_org.x.tools.go;

@:go.Type({ name: "packages", instanceName: "packages.packages", imports: ["golang.org/x/tools/go/packages"] })
extern class Packages {

    @:native("ListError") static var listError: go.golang_org.x.tools.go.packages.ErrorKind;
    @:native("LoadAllSyntax") static var loadAllSyntax: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadFiles") static var loadFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadImports") static var loadImports: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadSyntax") static var loadSyntax: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadTypes") static var loadTypes: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedCompiledGoFiles") static var needCompiledGoFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedDeps") static var needDeps: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedEmbedFiles") static var needEmbedFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedEmbedPatterns") static var needEmbedPatterns: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedExportFile") static var needExportFile: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedExportsFile") static var needExportsFile: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedFiles") static var needFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedForTest") static var needForTest: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedImports") static var needImports: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedModule") static var needModule: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedName") static var needName: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedSyntax") static var needSyntax: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTarget") static var needTarget: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTypes") static var needTypes: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTypesInfo") static var needTypesInfo: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTypesSizes") static var needTypesSizes: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("ParseError") static var parseError: go.golang_org.x.tools.go.packages.ErrorKind;
    @:native("TypeError") static var typeError: go.golang_org.x.tools.go.packages.ErrorKind;
    @:native("UnknownError") static var unknownError: go.golang_org.x.tools.go.packages.ErrorKind;

    @:native("Load") static function load(cfg: go.Pointer<go.golang_org.x.tools.go.packages.Config>, patterns: haxe.Rest<String>): (go.Result<go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>>);
    @:native("Postorder") static function postorder(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>): (go.iter.Seq<go.Pointer<go.golang_org.x.tools.go.packages.Package>>);
    @:native("PrintErrors") static function printErrors(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>): (go.GoInt);
    @:native("Visit") static function visit(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>, pre: (p0: go.Pointer<go.golang_org.x.tools.go.packages.Package>) -> (Bool), post: (p0: go.Pointer<go.golang_org.x.tools.go.packages.Package>) -> Void): Void;

}