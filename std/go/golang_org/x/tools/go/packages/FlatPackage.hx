package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "flatPackage", instanceName: "packages.flatPackage", imports: ["golang.org/x/tools/go/packages"] })
extern class FlatPackage {

    @:native("ID") var ID: String;
    @:native("Name") var name: String;
    @:native("PkgPath") var pkgPath: String;
    @:native("Errors") var errors: go.Slice<go.golang_org.x.tools.go.packages.Error>;
    @:native("GoFiles") var goFiles: go.Slice<String>;
    @:native("CompiledGoFiles") var compiledGoFiles: go.Slice<String>;
    @:native("OtherFiles") var otherFiles: go.Slice<String>;
    @:native("EmbedFiles") var embedFiles: go.Slice<String>;
    @:native("EmbedPatterns") var embedPatterns: go.Slice<String>;
    @:native("IgnoredFiles") var ignoredFiles: go.Slice<String>;
    @:native("ExportFile") var exportFile: String;
    @:native("Imports") var imports: go.Map<String, String>;

    function new(ID: String="", name: String="", pkgPath: String="", errors: go.Slice<go.golang_org.x.tools.go.packages.Error>=null, goFiles: go.Slice<String>=null, compiledGoFiles: go.Slice<String>=null, otherFiles: go.Slice<String>=null, embedFiles: go.Slice<String>=null, embedPatterns: go.Slice<String>=null, ignoredFiles: go.Slice<String>=null, exportFile: String="", imports: go.Map<String, String>=null);

}