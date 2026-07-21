package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "loaderPackage", instanceName: "packages.loaderPackage", imports: ["golang.org/x/tools/go/packages"] })
extern class LoaderPackage {

    @:native("Package") var _package: go.Pointer<go.golang_org.x.tools.go.packages.Package>;
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

    function new(_package: go.Pointer<go.golang_org.x.tools.go.packages.Package>);

    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    @:native("String") function string(): (String);
    @:native("UnmarshalJSON") function unmarshalJSON(b: go.Slice<go.Byte>): (go.Error);

}