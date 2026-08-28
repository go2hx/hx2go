package go.go.types;

/**
    An Importer resolves import paths to Packages.
    
    CAUTION: This interface does not support the import of locally
    vendored packages. See https://golang.org/s/go15vendor.
    If possible, external implementations should implement [ImporterFrom].
**/
@:go.Type({ name: "Importer", instanceName: "types.Importer", imports: ["go/types"] })
extern typedef Importer = {

    @:native("Import") function _import(path: std.String): (go.Result<go.Pointer<go.go.types.Package>>);

}