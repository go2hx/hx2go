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

    function new(importPath: String="", dir: String="", name: String="", target: String="", export: String="", goFiles: go.Slice<String>=null, compiledGoFiles: go.Slice<String>=null, ignoredGoFiles: go.Slice<String>=null, ignoredOtherFiles: go.Slice<String>=null, embedPatterns: go.Slice<String>=null, embedFiles: go.Slice<String>=null, cFiles: go.Slice<String>=null, cgoFiles: go.Slice<String>=null, cXXFiles: go.Slice<String>=null, mFiles: go.Slice<String>=null, hFiles: go.Slice<String>=null, fFiles: go.Slice<String>=null, sFiles: go.Slice<String>=null, swigFiles: go.Slice<String>=null, swigCXXFiles: go.Slice<String>=null, sysoFiles: go.Slice<String>=null, imports: go.Slice<String>=null, importMap: go.Map<String, String>=null, deps: go.Slice<String>=null, module: go.Pointer<go.golang_org.x.tools.go.packages.Module>=null, testGoFiles: go.Slice<String>=null, testImports: go.Slice<String>=null, xTestGoFiles: go.Slice<String>=null, xTestImports: go.Slice<String>=null, forTest: String="", depOnly: Bool=false, error: go.Pointer<Dynamic>=null, depsErrors: go.Slice<go.Pointer<Dynamic>>=null);

}