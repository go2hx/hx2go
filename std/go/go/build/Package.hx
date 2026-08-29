package go.go.build;

/**
    A Package describes the Go package found in a directory.
**/
@:structInit
@:go.Type({ name: "Package", instanceName: "build.Package", imports: ["go/build"] })
extern class Package {

    @:native("Dir") var dir: String;
    @:native("Name") var name: String;
    @:native("ImportComment") var importComment: String;
    @:native("Doc") var doc: String;
    @:native("ImportPath") var importPath: String;
    @:native("Root") var root: String;
    @:native("SrcRoot") var srcRoot: String;
    @:native("PkgRoot") var pkgRoot: String;
    @:native("PkgTargetRoot") var pkgTargetRoot: String;
    @:native("BinDir") var binDir: String;
    @:native("Goroot") var goroot: Bool;
    @:native("PkgObj") var pkgObj: String;
    @:native("AllTags") var allTags: go.Slice<String>;
    @:native("ConflictDir") var conflictDir: String;
    @:native("BinaryOnly") var binaryOnly: Bool;
    @:native("GoFiles") var goFiles: go.Slice<String>;
    @:native("CgoFiles") var cgoFiles: go.Slice<String>;
    @:native("IgnoredGoFiles") var ignoredGoFiles: go.Slice<String>;
    @:native("InvalidGoFiles") var invalidGoFiles: go.Slice<String>;
    @:native("IgnoredOtherFiles") var ignoredOtherFiles: go.Slice<String>;
    @:native("CFiles") var cFiles: go.Slice<String>;
    @:native("CXXFiles") var cXXFiles: go.Slice<String>;
    @:native("MFiles") var mFiles: go.Slice<String>;
    @:native("HFiles") var hFiles: go.Slice<String>;
    @:native("FFiles") var fFiles: go.Slice<String>;
    @:native("SFiles") var sFiles: go.Slice<String>;
    @:native("SwigFiles") var swigFiles: go.Slice<String>;
    @:native("SwigCXXFiles") var swigCXXFiles: go.Slice<String>;
    @:native("SysoFiles") var sysoFiles: go.Slice<String>;
    @:native("CgoCFLAGS") var cgoCFLAGS: go.Slice<String>;
    @:native("CgoCPPFLAGS") var cgoCPPFLAGS: go.Slice<String>;
    @:native("CgoCXXFLAGS") var cgoCXXFLAGS: go.Slice<String>;
    @:native("CgoFFLAGS") var cgoFFLAGS: go.Slice<String>;
    @:native("CgoLDFLAGS") var cgoLDFLAGS: go.Slice<String>;
    @:native("CgoPkgConfig") var cgoPkgConfig: go.Slice<String>;
    @:native("TestGoFiles") var testGoFiles: go.Slice<String>;
    @:native("XTestGoFiles") var xTestGoFiles: go.Slice<String>;
    @:native("Directives") var directives: go.Slice<go.go.build.Directive>;
    @:native("TestDirectives") var testDirectives: go.Slice<go.go.build.Directive>;
    @:native("XTestDirectives") var xTestDirectives: go.Slice<go.go.build.Directive>;
    @:native("Imports") var imports: go.Slice<String>;
    @:native("ImportPos") var importPos: go.Map<String, go.Slice<go.go.token.Position>>;
    @:native("TestImports") var testImports: go.Slice<String>;
    @:native("TestImportPos") var testImportPos: go.Map<String, go.Slice<go.go.token.Position>>;
    @:native("XTestImports") var xTestImports: go.Slice<String>;
    @:native("XTestImportPos") var xTestImportPos: go.Map<String, go.Slice<go.go.token.Position>>;
    @:native("EmbedPatterns") var embedPatterns: go.Slice<String>;
    @:native("EmbedPatternPos") var embedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>;
    @:native("TestEmbedPatterns") var testEmbedPatterns: go.Slice<String>;
    @:native("TestEmbedPatternPos") var testEmbedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>;
    @:native("XTestEmbedPatterns") var xTestEmbedPatterns: go.Slice<String>;
    @:native("XTestEmbedPatternPos") var xTestEmbedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>;

    function new(dir: String="", name: String="", importComment: String="", doc: String="", importPath: String="", root: String="", srcRoot: String="", pkgRoot: String="", pkgTargetRoot: String="", binDir: String="", goroot: Bool=false, pkgObj: String="", allTags: go.Slice<String>=null, conflictDir: String="", binaryOnly: Bool=false, goFiles: go.Slice<String>=null, cgoFiles: go.Slice<String>=null, ignoredGoFiles: go.Slice<String>=null, invalidGoFiles: go.Slice<String>=null, ignoredOtherFiles: go.Slice<String>=null, cFiles: go.Slice<String>=null, cXXFiles: go.Slice<String>=null, mFiles: go.Slice<String>=null, hFiles: go.Slice<String>=null, fFiles: go.Slice<String>=null, sFiles: go.Slice<String>=null, swigFiles: go.Slice<String>=null, swigCXXFiles: go.Slice<String>=null, sysoFiles: go.Slice<String>=null, cgoCFLAGS: go.Slice<String>=null, cgoCPPFLAGS: go.Slice<String>=null, cgoCXXFLAGS: go.Slice<String>=null, cgoFFLAGS: go.Slice<String>=null, cgoLDFLAGS: go.Slice<String>=null, cgoPkgConfig: go.Slice<String>=null, testGoFiles: go.Slice<String>=null, xTestGoFiles: go.Slice<String>=null, directives: go.Slice<go.go.build.Directive>=null, testDirectives: go.Slice<go.go.build.Directive>=null, xTestDirectives: go.Slice<go.go.build.Directive>=null, imports: go.Slice<String>=null, importPos: go.Map<String, go.Slice<go.go.token.Position>>=null, testImports: go.Slice<String>=null, testImportPos: go.Map<String, go.Slice<go.go.token.Position>>=null, xTestImports: go.Slice<String>=null, xTestImportPos: go.Map<String, go.Slice<go.go.token.Position>>=null, embedPatterns: go.Slice<String>=null, embedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>=null, testEmbedPatterns: go.Slice<String>=null, testEmbedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>=null, xTestEmbedPatterns: go.Slice<String>=null, xTestEmbedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>=null);

    /**
        IsCommand reports whether the package is considered a
        command to be installed (not just a library).
        Packages named "main" are treated as commands.
    **/
    @:native("IsCommand") function isCommand(): (Bool);

}