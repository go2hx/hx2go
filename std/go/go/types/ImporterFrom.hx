package go.go.types;

@:go.Type({ name: "ImporterFrom", instanceName: "types.ImporterFrom", imports: ["go/types"] })
extern typedef ImporterFrom = {

    @:native("Import") function _import(path: String): (go.Result<go.Pointer<go.go.types.Package>>);
    @:native("ImportFrom") function importFrom(path: String, dir: String, mode: go.go.types.ImportMode): (go.Result<go.Pointer<go.go.types.Package>>);

}