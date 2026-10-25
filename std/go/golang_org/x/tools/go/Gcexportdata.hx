package go.golang_org.x.tools.go;

/**
    Package gcexportdata provides functions for writing and reading
    export data, a serialized representation of a [types.Package].
    It describes the API of a Go package, including the names,
    kinds, types, and locations of all exported declarations.
    
    Files may be written and read using the [Write] and [Read]
    functions.
    Alternatively, files may be produced by the "go list -export" command.
    This command runs the type checker on each specified Go package and
    writes export data for each package into a file named by the Export
    field of go list's -json output.
    The [Read] function may then be used to read those files.
    
    The export data format evolves with each Go release. As a matter of
    policy, [Read] supports reading files produced by only the last two
    Go releases plus tip; see https://go.dev/issue/68898.
    
    The name of this package reflects its origins at a time when
    cmd/compile was named gc, and [Read] parsed export data
    from .a archives produced by the Go compiler.
    However, starting with go1.28, the format of the files
    produced by "go list -export" will diverge from the format
    used by the standard Go compiler.
    Consequently, this package will eventually stop being
    capable of reading those files.
    In the meantime, when using [Read] on a .a file written by the
    compiler, be aware that export data is not at the start of the file.
    Before calling Read, one must use [NewReader] to locate the export
    data section of the file.
    For more information on the compiler's export data, see the
    "Export" section in the GOROOT/src/cmd/compile/README file.
    
    # Deprecations
    
    The [NewImporter], [Find], and [NewReader] functions are deprecated
    and should not be used in new code.
    The [WriteBundle] and [ReadBundle] functions are obsolete experiments
    and are no longer supported (https://go.dev/issue/69573).
**/
@:go.Type({ name: "gcexportdata", instanceName: "gcexportdata.gcexportdata", imports: ["golang.org/x/tools/go/gcexportdata"] })
extern class Gcexportdata {

    /**
        Find returns the name of an object (.o) or archive (.a) file
        containing type information for the specified import path,
        using the go command.
        If no file was found, an empty filename is returned.
        
        A relative srcDir is interpreted relative to the current working directory.
        
        Find also returns the package's resolved (canonical) import path,
        reflecting the effects of srcDir and vendoring on importPath.
        
        Deprecated: Use the higher-level API in golang.org/x/tools/go/packages,
        which is more efficient.
    **/
    @:go.Tuple("filename", "path") @:native("Find") static function find(importPath: String, srcDir: String): (go.Tuple<{ filename: String, path: String }>);
    /**
        NewImporter returns a new instance of the types.Importer interface
        that reads type information from export data files written by gc.
        The Importer also satisfies types.ImporterFrom.
        
        Export data files are located using "go build" workspace conventions
        and the build.Default context.
        
        Use this importer instead of go/importer.For("gc", ...) to avoid the
        version-skew problems described in the documentation of this package,
        or to control the FileSet or access the imports map populated during
        package loading.
        
        Deprecated: Use the higher-level API in golang.org/x/tools/go/packages,
        which is more efficient.
    **/
    @:native("NewImporter") static function newImporter(fset: go.Pointer<go.go.token.FileSet>, imports: go.Map<String, go.Pointer<go.go.types.Package>>): (go.go.types.ImporterFrom);
    /**
        NewReader returns a reader for export data read from r. Export data
        may be read from:
        
          - The export data section of an object (.o) or archive file (.a).
            In this case, the new reader may provide additional trailing data
            beyond the end of the export data.
          - The output of the cmd/export tool (e.g. via "go list -export").
            In this case, the new reader contains no trailing data.
        
        Deprecated: This package will stop supporting the reading of export
        data from compiler-produced archive files in Go 1.29. To read
        cmd/export files, use [Read] directly instead.
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Result<go.io.Reader>);
    /**
        Read reads export data from in, decodes it, and returns type
        information for the package.
        
        Read is capable of reading export data produced by [Write] at the
        same source code version, or by the last two Go releases (plus tip)
        of the standard Go compiler. Reading files from older compilers may
        produce an error.
        
        The package path (effectively its linker symbol prefix) is
        specified by path, since unlike the package name, this information
        may not be recorded in the export data.
        
        File position information is added to fset.
        
        Read may inspect and add to the imports map to ensure that references
        within the export data to other packages are consistent.  The caller
        must ensure that imports[path] does not exist, or exists but is
        incomplete (see types.Package.Complete), and Read inserts the
        resulting package into this map entry.
        
        On return, the state of the reader is undefined.
    **/
    @:native("Read") static function read(_in: go.io.Reader, fset: go.Pointer<go.go.token.FileSet>, imports: go.Map<String, go.Pointer<go.go.types.Package>>, path: String): (go.Result<go.Pointer<go.go.types.Package>>);
    /**
        Deprecated: ReadBundle is an unsupported obsolete experimental API. It returns an error.
    **/
    @:native("ReadBundle") static function readBundle(_in: go.io.Reader, fset: go.Pointer<go.go.token.FileSet>, imports: go.Map<String, go.Pointer<go.go.types.Package>>): (go.Result<go.Slice<go.Pointer<go.go.types.Package>>>);
    /**
        Write writes encoded type information for the specified package to out.
        The FileSet provides file position information for named objects.
    **/
    @:native("Write") static function write(out: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, pkg: go.Pointer<go.go.types.Package>): (go.Error);
    /**
        Deprecated: WriteBundle is an unsupported obsolete experimental API. It returns an error.
    **/
    @:native("WriteBundle") static function writeBundle(p0: go.io.Writer, p1: go.Pointer<go.go.token.FileSet>, p2: go.Slice<go.Pointer<go.go.types.Package>>): (go.Error);

}