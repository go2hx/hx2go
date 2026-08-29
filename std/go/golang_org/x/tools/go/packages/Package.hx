package go.golang_org.x.tools.go.packages;

/**
    A Package describes a loaded Go package.
    
    It also defines part of the JSON schema of [DriverResponse].
    See the package documentation for an overview.
**/
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

    function new(ID: String="", name: String="", pkgPath: String="", dir: String="", errors: go.Slice<go.golang_org.x.tools.go.packages.Error>=null, typeErrors: go.Slice<go.go.types.Error>=null, goFiles: go.Slice<String>=null, compiledGoFiles: go.Slice<String>=null, otherFiles: go.Slice<String>=null, embedFiles: go.Slice<String>=null, embedPatterns: go.Slice<String>=null, ignoredFiles: go.Slice<String>=null, exportFile: String="", target: String="", imports: go.Map<String, go.Pointer<go.golang_org.x.tools.go.packages.Package>>=null, module: go.Pointer<go.golang_org.x.tools.go.packages.Module>=null, types: go.Pointer<go.go.types.Package>=null, fset: go.Pointer<go.go.token.FileSet>=null, illTyped: Bool=false, syntax: go.Slice<go.Pointer<go.go.ast.File>>=null, typesInfo: go.Pointer<go.go.types.Info>=null, typesSizes: go.go.types.Sizes=null, forTest: String="");

    /**
        MarshalJSON returns the Package in its JSON form.
        For the most part, the structure fields are written out unmodified, and
        the type and syntax fields are skipped.
        The imports are written out as just a map of path to package id.
        The errors are written using a custom type that tries to preserve the
        structure of error types we know about.
        
        This method exists to enable support for additional build systems.  It is
        not intended for use by clients of the API and we may change the format.
    **/
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    @:native("String") function string(): (String);
    /**
        UnmarshalJSON reads in a Package from its JSON format.
        See MarshalJSON for details about the format accepted.
    **/
    @:native("UnmarshalJSON") function unmarshalJSON(b: go.Slice<go.Byte>): (go.Error);

}