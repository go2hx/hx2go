package go.go;

/**
    Package importer provides access to export data importers.
    
    These functions, which are mostly deprecated, date from before the
    introduction of modules in release Go 1.11. They should no longer
    be relied on except for use in test cases using small programs that
    depend only on the standard library. For reliable module-aware
    loading of type information, use the packages.Load function from
    golang.org/x/tools/go/packages.
**/
@:go.Type({ name: "importer", instanceName: "importer.importer", imports: ["go/importer"] })
extern class Importer {

    /**
        Default returns an Importer for the compiler that built the running binary.
        If available, the result implements [types.ImporterFrom].
        
        Default may be convenient for use in the simplest of cases, but
        most clients should instead use [ForCompiler], which accepts a
        [token.FileSet] from the caller; without it, all position
        information derived from the Importer will be incorrect and
        misleading. See also the package documentation.
    **/
    @:native("Default") static function _default(): (go.go.types.Importer);
    /**
        For calls [ForCompiler] with a new FileSet.
        
        Deprecated: Use [ForCompiler], which populates a FileSet
        with the positions of objects created by the importer.
    **/
    @:native("For") static function _for(compiler: String, lookup: go.go.importer.Lookup): (go.go.types.Importer);
    /**
        ForCompiler returns an Importer for importing from installed packages
        for the compilers "gc" and "gccgo", or for importing directly
        from the source if the compiler argument is "source". In this
        latter case, importing may fail under circumstances where the
        exported API is not entirely defined in pure Go source code
        (if the package API depends on cgo-defined entities, the type
        checker won't have access to those).
        
        The lookup function is called each time the resulting importer needs
        to resolve an import path. In this mode the importer can only be
        invoked with canonical import paths (not relative or absolute ones);
        it is assumed that the translation to canonical import paths is being
        done by the client of the importer.
        
        A lookup function must be provided for correct module-aware operation.
        Deprecated: If lookup is nil, for backwards-compatibility, the importer
        will attempt to resolve imports in the $GOPATH workspace.
    **/
    @:native("ForCompiler") static function forCompiler(fset: go.Pointer<go.go.token.FileSet>, compiler: String, lookup: go.go.importer.Lookup): (go.go.types.Importer);

}