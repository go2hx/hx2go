package go.golang_org.x.tools.go;

/**
    Package packages loads Go packages for inspection and analysis.
    
    The [Load] function takes as input a list of patterns and returns a
    list of [Package] values describing individual packages matched by those
    patterns.
    A [Config] specifies configuration options, the most important of which is
    the [LoadMode], which controls the amount of detail in the loaded packages.
    
    Load passes most patterns directly to the underlying build tool.
    The default build tool is the go command.
    Its supported patterns are described at
    https://pkg.go.dev/cmd/go#hdr-Package_lists_and_patterns.
    Other build systems may be supported by providing a "driver";
    see [The driver protocol].
    
    All patterns with the prefix "query=", where query is a
    non-empty string of letters from [a-z], are reserved and may be
    interpreted as query operators.
    
    Two query operators are currently supported: "file" and "pattern".
    
    The query "file=path/to/file.go" matches the package or packages enclosing
    the Go source file path/to/file.go.  For example "file=~/go/src/fmt/print.go"
    might return the packages "fmt" and "fmt [fmt.test]".
    
    The query "pattern=string" causes "string" to be passed directly to
    the underlying build tool. In most cases this is unnecessary,
    but an application can use Load("pattern=" + x) as an escaping mechanism
    to ensure that x is not interpreted as a query operator if it contains '='.
    
    All other query operators are reserved for future use and currently
    cause Load to report an error.
    
    The Package struct provides basic information about the package, including
    
      - ID, a unique identifier for the package in the returned set;
      - GoFiles, the names of the package's Go source files;
      - Imports, a map from source import strings to the Packages they name;
      - Types, the type information for the package's exported symbols;
      - Syntax, the parsed syntax trees for the package's source code; and
      - TypesInfo, the result of a complete type-check of the package syntax trees.
    
    (See the documentation for type Package for the complete list of fields
    and more detailed descriptions.)
    
    For example,
    
    	Load(nil, "bytes", "unicode...")
    
    returns four Package structs describing the standard library packages
    bytes, unicode, unicode/utf16, and unicode/utf8. Note that one pattern
    can match multiple packages and that a package might be matched by
    multiple patterns: in general it is not possible to determine which
    packages correspond to which patterns.
    
    Note that the list returned by Load contains only the packages matched
    by the patterns. Their dependencies can be found by walking the import
    graph using the Imports fields.
    
    The Load function can be configured by passing a pointer to a Config as
    the first argument. A nil Config is equivalent to the zero Config, which
    causes Load to run in [LoadFiles] mode, collecting minimal information.
    See the documentation for type Config for details.
    
    As noted earlier, the Config.Mode controls the amount of detail
    reported about the loaded packages. See the documentation for type LoadMode
    for details.
    
    Most tools should pass their command-line arguments (after any flags)
    uninterpreted to Load, so that it can interpret them
    according to the conventions of the underlying build system.
    
    See the Example function for typical usage.
    See also [golang.org/x/tools/go/packages/internal/linecount]
    for an example application.
    
    # The driver protocol
    
    Load may be used to load Go packages even in Go projects that use
    alternative build systems, by installing an appropriate "driver"
    program for the build system and specifying its location in the
    GOPACKAGESDRIVER environment variable.
    For example,
    https://github.com/bazelbuild/rules_go/wiki/Editor-and-tool-integration
    explains how to use the driver for Bazel.
    
    The driver program is responsible for interpreting patterns in its
    preferred notation and reporting information about the packages that
    those patterns identify. Drivers must also support the special "file="
    and "pattern=" patterns described above.
    
    The patterns are provided as positional command-line arguments. A
    JSON-encoded [DriverRequest] message providing additional information
    is written to the driver's standard input. The driver must write a
    JSON-encoded [DriverResponse] message to its standard output. (This
    message differs from the JSON schema produced by 'go list'.)
    
    The value of the PWD environment variable seen by the driver process
    is the preferred name of its working directory. (The working directory
    may have other aliases due to symbolic links; see the comment on the
    Dir field of [exec.Cmd] for related information.)
    When the driver process emits in its response the name of a file
    that is a descendant of this directory, it must use an absolute path
    that has the value of PWD as a prefix, to ensure that the returned
    filenames satisfy the original query.
**/
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

    /**
        Load loads and returns the Go packages named by the given patterns.
        
        The cfg parameter specifies loading options; nil behaves the same as an empty [Config].
        
        The [Config.Mode] field is a set of bits that determine what kinds
        of information should be computed and returned. Modes that require
        more information tend to be slower. See [LoadMode] for details
        and important caveats. Its zero value is equivalent to
        [NeedName] | [NeedFiles] | [NeedCompiledGoFiles].
        
        Each call to Load returns a new set of [Package] instances.
        The Packages and their Imports form a directed acyclic graph.
        
        If the [NeedTypes] mode flag was set, each call to Load uses a new
        [types.Importer], so [types.Object] and [types.Type] values from
        different calls to Load must not be mixed as they will have
        inconsistent notions of type identity.
        
        If any of the patterns was invalid as defined by the
        underlying build system, Load returns an error.
        It may return an empty list of packages without an error,
        for instance for an empty expansion of a valid wildcard.
        Errors associated with a particular package are recorded in the
        corresponding Package's Errors list, and do not cause Load to
        return an error. Clients may need to handle such errors before
        proceeding with further analysis. The [PrintErrors] function is
        provided for convenient display of all errors.
    **/
    @:native("Load") static function load(cfg: go.Pointer<go.golang_org.x.tools.go.packages.Config>, patterns: haxe.Rest<String>): (go.Result<go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>>);
    /**
        Postorder returns an iterator over the packages in
        the import graph whose roots are pkg.
        Packages are enumerated in dependencies-first order.
    **/
    @:native("Postorder") static function postorder(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>): (go.iter.Seq<go.Pointer<go.golang_org.x.tools.go.packages.Package>>);
    /**
        PrintErrors prints to os.Stderr the accumulated errors of all
        packages in the import graph rooted at pkgs, dependencies first.
        PrintErrors returns the number of errors printed.
    **/
    @:native("PrintErrors") static function printErrors(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>): (go.GoInt);
    /**
        Visit visits all the packages in the import graph whose roots are
        pkgs, calling the optional pre function the first time each package
        is encountered (preorder), and the optional post function after a
        package's dependencies have been visited (postorder).
        The boolean result of pre(pkg) determines whether
        the imports of package pkg are visited.
        
        Example:
        
        	pkgs, err := Load(...)
        	if err != nil { ... }
        	Visit(pkgs, nil, func(pkg *Package) {
        		log.Println(pkg)
        	})
        
        In most cases, it is more convenient to use [Postorder]:
        
        	for pkg := range Postorder(pkgs) {
        		log.Println(pkg)
        	}
    **/
    @:native("Visit") static function visit(pkgs: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>, pre: (p0: go.Pointer<go.golang_org.x.tools.go.packages.Package>) -> (Bool), post: (p0: go.Pointer<go.golang_org.x.tools.go.packages.Package>) -> Void): Void;

}