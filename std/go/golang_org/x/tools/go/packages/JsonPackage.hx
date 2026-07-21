package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "jsonPackage", instanceName: "packages.jsonPackage", imports: ["golang.org/x/tools/go/packages"] })
extern class JsonPackage {

    @:native("ImportPath") var importPath: String;
    @:native("Dir") var dir: String;
    @:native("Name") var name: String;
    @:native("Target") var target: String;
    @:native("Export") var export: String;
    @:native("GoFiles") var goFiles: go.Slice<String>;
    @:native("CompiledGoFiles") var compiledGoFiles: go.Slice<String>;
    @:native("IgnoredGoFiles") var ignoredGoFiles: go.Slice<String>;
    @:native("IgnoredOtherFiles") var ignoredOtherFiles: go.Slice<String>;
    @:native("EmbedPatterns") var embedPatterns: go.Slice<String>;
    @:native("EmbedFiles") var embedFiles: go.Slice<String>;
    @:native("CFiles") var cFiles: go.Slice<String>;
    @:native("CgoFiles") var cgoFiles: go.Slice<String>;
    @:native("CXXFiles") var cXXFiles: go.Slice<String>;
    @:native("MFiles") var mFiles: go.Slice<String>;
    @:native("HFiles") var hFiles: go.Slice<String>;
    @:native("FFiles") var fFiles: go.Slice<String>;
    @:native("SFiles") var sFiles: go.Slice<String>;
    @:native("SwigFiles") var swigFiles: go.Slice<String>;
    @:native("SwigCXXFiles") var swigCXXFiles: go.Slice<String>;
    @:native("SysoFiles") var sysoFiles: go.Slice<String>;
    @:native("Imports") var imports: go.Slice<String>;
    @:native("ImportMap") var importMap: go.Map<String, String>;
    @:native("Deps") var deps: go.Slice<String>;
    @:native("Module") var module: go.Pointer<go.golang_org.x.tools.go.packages.Module>;
    @:native("TestGoFiles") var testGoFiles: go.Slice<String>;
    @:native("TestImports") var testImports: go.Slice<String>;
    @:native("XTestGoFiles") var xTestGoFiles: go.Slice<String>;
    @:native("XTestImports") var xTestImports: go.Slice<String>;
    @:native("ForTest") var forTest: String;
    @:native("DepOnly") var depOnly: Bool;
    @:native("Error") var error: go.Pointer<Dynamic>;
    @:native("DepsErrors") var depsErrors: go.Slice<go.Pointer<Dynamic>>;

    function new(importPath: String, dir: String, name: String, target: String, export: String, goFiles: go.Slice<String>, compiledGoFiles: go.Slice<String>, ignoredGoFiles: go.Slice<String>, ignoredOtherFiles: go.Slice<String>, embedPatterns: go.Slice<String>, embedFiles: go.Slice<String>, cFiles: go.Slice<String>, cgoFiles: go.Slice<String>, cXXFiles: go.Slice<String>, mFiles: go.Slice<String>, hFiles: go.Slice<String>, fFiles: go.Slice<String>, sFiles: go.Slice<String>, swigFiles: go.Slice<String>, swigCXXFiles: go.Slice<String>, sysoFiles: go.Slice<String>, imports: go.Slice<String>, importMap: go.Map<String, String>, deps: go.Slice<String>, module: go.Pointer<go.golang_org.x.tools.go.packages.Module>, testGoFiles: go.Slice<String>, testImports: go.Slice<String>, xTestGoFiles: go.Slice<String>, xTestImports: go.Slice<String>, forTest: String, depOnly: Bool, error: go.Pointer<Dynamic>, depsErrors: go.Slice<go.Pointer<Dynamic>>);

}