package go.go.types;

/**
    An ImporterFrom resolves import paths to packages; it
    supports vendoring per https://golang.org/s/go15vendor.
    Use go/importer to obtain an ImporterFrom implementation.
**/
@:go.Type({ name: "ImporterFrom", instanceName: "types.ImporterFrom", imports: ["go/types"] })
extern typedef ImporterFrom = {

    @:native("Import") function _import(path: std.String): (go.Result<go.Pointer<go.go.types.Package>>);
    @:native("ImportFrom") function importFrom(path: std.String, dir: std.String, mode: go.go.types.ImportMode): (go.Result<go.Pointer<go.go.types.Package>>);

}