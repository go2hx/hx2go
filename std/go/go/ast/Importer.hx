package go.go.ast;

/**
    An Importer resolves import paths to package Objects.
    The imports map records the packages already imported,
    indexed by package id (canonical import path).
    An Importer must determine the canonical import path and
    check the map to see if it is already present in the imports map.
    If so, the Importer can return the map entry. Otherwise, the
    Importer should load the package data for the given path into
    a new *[Object] (pkg), record pkg in the imports map, and then
    return pkg.
    
    Deprecated: use the type checker [go/types] instead; see [Object].
**/
@:go.Type({ name: "Importer", instanceName: "ast.Importer", imports: ["go/ast"] })
extern class Importer {

}