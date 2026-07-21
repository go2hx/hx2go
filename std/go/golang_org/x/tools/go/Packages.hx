package go.golang_org.x.tools.go;

@:go.Type({ name: "packages", instanceName: "packages.packages", imports: ["golang.org/x/tools/go/packages"] })
extern class Packages {

    @:native("ListError") static var ListError: go.golang_org.x.tools.go.packages.ErrorKind;
    @:native("LoadAllSyntax") static var LoadAllSyntax: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadFiles") static var LoadFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadImports") static var LoadImports: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadSyntax") static var LoadSyntax: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("LoadTypes") static var LoadTypes: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedCompiledGoFiles") static var NeedCompiledGoFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedDeps") static var NeedDeps: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedEmbedFiles") static var NeedEmbedFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedEmbedPatterns") static var NeedEmbedPatterns: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedExportFile") static var NeedExportFile: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedExportsFile") static var NeedExportsFile: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedFiles") static var NeedFiles: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedForTest") static var NeedForTest: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedImports") static var NeedImports: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedModule") static var NeedModule: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedName") static var NeedName: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedSyntax") static var NeedSyntax: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTarget") static var NeedTarget: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTypes") static var NeedTypes: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTypesInfo") static var NeedTypesInfo: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("NeedTypesSizes") static var NeedTypesSizes: go.golang_org.x.tools.go.packages.LoadMode;
    @:native("ParseError") static var ParseError: go.golang_org.x.tools.go.packages.ErrorKind;
    @:native("TypeError") static var TypeError: go.golang_org.x.tools.go.packages.ErrorKind;
    @:native("UnknownError") static var UnknownError: go.golang_org.x.tools.go.packages.ErrorKind;

    @:native("Load") static function load(cfg: go.Pointer<go.golang_org.x.tools.go.packages.Config>, patterns: haxe.Rest<String>): (go.Result<go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>>);
    @:native("Postorder") static function postorder(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>): (go.iter.Seq<go.Pointer<go.golang_org.x.tools.go.packages.Package>>);
    @:native("PrintErrors") static function printErrors(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>): (go.GoInt);
    @:native("Visit") static function visit(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>, pre: (p0: go.Pointer<go.golang_org.x.tools.go.packages.Package>) -> (Bool), post: (p0: go.Pointer<go.golang_org.x.tools.go.packages.Package>) -> Void): Void;

}