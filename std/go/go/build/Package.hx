package go.go.build;

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

    function new(dir: String, name: String, importComment: String, doc: String, importPath: String, root: String, srcRoot: String, pkgRoot: String, pkgTargetRoot: String, binDir: String, goroot: Bool, pkgObj: String, allTags: go.Slice<String>, conflictDir: String, binaryOnly: Bool, goFiles: go.Slice<String>, cgoFiles: go.Slice<String>, ignoredGoFiles: go.Slice<String>, invalidGoFiles: go.Slice<String>, ignoredOtherFiles: go.Slice<String>, cFiles: go.Slice<String>, cXXFiles: go.Slice<String>, mFiles: go.Slice<String>, hFiles: go.Slice<String>, fFiles: go.Slice<String>, sFiles: go.Slice<String>, swigFiles: go.Slice<String>, swigCXXFiles: go.Slice<String>, sysoFiles: go.Slice<String>, cgoCFLAGS: go.Slice<String>, cgoCPPFLAGS: go.Slice<String>, cgoCXXFLAGS: go.Slice<String>, cgoFFLAGS: go.Slice<String>, cgoLDFLAGS: go.Slice<String>, cgoPkgConfig: go.Slice<String>, testGoFiles: go.Slice<String>, xTestGoFiles: go.Slice<String>, directives: go.Slice<go.go.build.Directive>, testDirectives: go.Slice<go.go.build.Directive>, xTestDirectives: go.Slice<go.go.build.Directive>, imports: go.Slice<String>, importPos: go.Map<String, go.Slice<go.go.token.Position>>, testImports: go.Slice<String>, testImportPos: go.Map<String, go.Slice<go.go.token.Position>>, xTestImports: go.Slice<String>, xTestImportPos: go.Map<String, go.Slice<go.go.token.Position>>, embedPatterns: go.Slice<String>, embedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>, testEmbedPatterns: go.Slice<String>, testEmbedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>, xTestEmbedPatterns: go.Slice<String>, xTestEmbedPatternPos: go.Map<String, go.Slice<go.go.token.Position>>);

    @:native("IsCommand") function isCommand(): (Bool);

}