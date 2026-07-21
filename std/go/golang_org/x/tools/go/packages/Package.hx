package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "Package", instanceName: "packages.Package", imports: ["golang.org/x/tools/go/packages"] })
extern class Package {

    @:native("ID") var ID: String;
    @:native("Name") var name: String;
    @:native("PkgPath") var pkgPath: String;
    @:native("Dir") var dir: String;
    @:native("Errors") var errors: go.Slice<go.golang_org.x.tools.go.packages.Error>;
    @:native("TypeErrors") var typeErrors: go.Slice<go.go.types.Error>;
    @:native("GoFiles") var goFiles: go.Slice<String>;
    @:native("CompiledGoFiles") var compiledGoFiles: go.Slice<String>;
    @:native("OtherFiles") var otherFiles: go.Slice<String>;
    @:native("EmbedFiles") var embedFiles: go.Slice<String>;
    @:native("EmbedPatterns") var embedPatterns: go.Slice<String>;
    @:native("IgnoredFiles") var ignoredFiles: go.Slice<String>;
    @:native("ExportFile") var exportFile: String;
    @:native("Target") var target: String;
    @:native("Imports") var imports: go.Map<String, go.Pointer<go.golang_org.x.tools.go.packages.Package>>;
    @:native("Module") var module: go.Pointer<go.golang_org.x.tools.go.packages.Module>;
    @:native("Types") var types: go.Pointer<go.go.types.Package>;
    @:native("Fset") var fset: go.Pointer<go.go.token.FileSet>;
    @:native("IllTyped") var illTyped: Bool;
    @:native("Syntax") var syntax: go.Slice<go.Pointer<go.go.ast.File>>;
    @:native("TypesInfo") var typesInfo: go.Pointer<go.go.types.Info>;
    @:native("TypesSizes") var typesSizes: go.go.types.Sizes;
    @:native("ForTest") var forTest: String;

    function new(ID: String, name: String, pkgPath: String, dir: String, errors: go.Slice<go.golang_org.x.tools.go.packages.Error>, typeErrors: go.Slice<go.go.types.Error>, goFiles: go.Slice<String>, compiledGoFiles: go.Slice<String>, otherFiles: go.Slice<String>, embedFiles: go.Slice<String>, embedPatterns: go.Slice<String>, ignoredFiles: go.Slice<String>, exportFile: String, target: String, imports: go.Map<String, go.Pointer<go.golang_org.x.tools.go.packages.Package>>, module: go.Pointer<go.golang_org.x.tools.go.packages.Module>, types: go.Pointer<go.go.types.Package>, fset: go.Pointer<go.go.token.FileSet>, illTyped: Bool, syntax: go.Slice<go.Pointer<go.go.ast.File>>, typesInfo: go.Pointer<go.go.types.Info>, typesSizes: go.go.types.Sizes, forTest: String);

    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    @:native("String") function string(): (String);
    @:native("UnmarshalJSON") function unmarshalJSON(b: go.Slice<go.Byte>): (go.Error);

}